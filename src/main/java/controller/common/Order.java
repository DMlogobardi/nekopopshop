package controller.common;

import controller.tools.JsonConverter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bean.*;
import model.DAO.*;
import model.DTO.OrderDTO;
import model.SessionCart;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/common/order")
public class Order extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public Order() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // non rimuovo i prodotti dal db quando li compro
        HttpSession session = request.getSession();
        if(session.getAttribute("logToken") == null){
            request.setAttribute("error", "utent is not logged in");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        JsonConverter<OrderDTO> converter = JsonConverter.factory(OrderDTO.class, request.getReader());
        OrderDTO order = null;

        try {
            order = converter.parse();
        } catch (Exception e) {
            System.out.println("error in parsing order: " + e.getMessage());
            request.setAttribute("error", "internal error");
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
            return;
        }

        DataSource ds = (DataSource) session.getServletContext().getAttribute("dataSource");
        MetodopagamentoDAO cardDB = new MetodopagamentoDAO(ds);
        IndirizzoDAO indirizzoDB = new IndirizzoDAO(ds);
        IndirizzoBean indirizzo = null;
        MetodoPagamentoBean card = null;

        try {
            indirizzo = indirizzoDB.doRetrieveByKeyAndCliente(order.getIndirizzo(), (int) session.getAttribute("logId"));
            card = cardDB.doRetrieveByKeyAndCliente(order.getCard(), (int) session.getAttribute("logId"));
        } catch (SQLException e) {
            System.out.println("error in order: " + e.getMessage());
            request.setAttribute("error", "internal error");
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
            return;
        }

        if(card == null){
            System.out.println("error in order");
            request.setAttribute("error", "internal error");
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
            return;
        }

        LocalDate oggi = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        if (card.getDataScadenzaFormatted().isBefore(oggi)) {
            System.out.println("carta scaduta");
            request.setAttribute("error", "card data scadenza is before oggi");
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
            return;
        }

        SessionCart sCart = (SessionCart) session.getAttribute("cart");
        OrdineDAO dbOrder = new OrdineDAO(ds);
        OrdineBean ordine = new OrdineBean(
                0,
                sCart.getCarelloRefernz().getTot() - sCart.getCarelloRefernz().getTot() * (sCart.getCarelloRefernz().getSconti() / 100.0),
                oggi.toString(),
                "",
                (int) session.getAttribute("logId"),
                indirizzo.getIdIndirizzo(),
                card.getIdMetodoPagamento()

        );
        ordine.setDataArrivos(OrdineBean.calcolaDataConGiorniLavorativi(3).toString());
        int idOrdine;

        try {
            idOrdine = dbOrder.doSave(ordine);
        } catch (SQLException e) {
            System.out.println("order error: " + e.getMessage());
            request.setAttribute("error", "internal error");
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
            return;
        }

        AcquistatoDAO acquistatoDB = new AcquistatoDAO(ds);
        ContenutoDAO contenutoDB = new ContenutoDAO(ds);
        VolumeDAO volumeDB = new VolumeDAO(ds);
        ProdottoDAO prodottoDB = new ProdottoDAO(ds);
        CapitoloDAO capitoloDAO = new CapitoloDAO(ds);
        ReaderDAO readerDAO = new ReaderDAO(ds);
        CapitoloBean cap = null;
        int quantitaDB = 0;
        for(ContenutoBean conte : sCart.getContenuti()){
            //controllo quantità
            try {
                if (conte.getIdProdotto() != null || conte.getIdProdotto() != 0) {
                    quantitaDB = prodottoDB.doRetrieveQuantity(conte.getIdProdotto());
                } else {
                    quantitaDB = volumeDB.doRetrieveQuantity(conte.getIdVolume());
                    cap = (CapitoloBean) capitoloDAO.doRetrieveAllLimitByVol(null, 1,0, conte.getIdVolume());
                }
            } catch (SQLException e) {
                System.out.println("order error quantita db: " + e.getMessage());
                request.setAttribute("error", "internal error");
                request.getRequestDispatcher("/cart.jsp").forward(request, response);
                return;
            }

            if(cap != null){
                try {
                    ReaderBean reader = readerDAO.doRetrieveByVolAndUtent(conte.getIdVolume(), (int) session.getAttribute("logId") );
                    if(reader == null)
                        readerDAO.doSave(new ReaderBean(0, oggi.format(formatter), null, conte.getIdVolume(), (int) session.getAttribute("logId")));
                } catch (SQLException e) {
                    System.out.println("order error save reader db: " + e.getMessage());
                    request.setAttribute("error", "internal error");
                    request.getRequestDispatcher("/cart.jsp").forward(request, response);
                    return;
                }
            }

            if(quantitaDB < conte.getqCarrello()) {
                AcquistatoBean acquistato = conte.convertirAcquistato(idOrdine);

                try {
                    contenutoDB.doDeleteByCart(sCart.getCarelloRefernz().getIdCarello());
                    acquistatoDB.doSave(acquistato);
                    if (acquistato.getIdProdotto() == null || acquistato.getIdProdotto() == 0) {
                        volumeDB.decrementQuantita(acquistato.getqAcquistato(), acquistato.getIdVolume());
                    } else {
                        prodottoDB.decrementQuantita(acquistato.getqAcquistato(), acquistato.getIdProdotto());
                    }
                } catch (SQLException e) {
                    try {
                        dbOrder.doDelete(idOrdine);
                    } catch (SQLException ex) {
                        System.out.println("order delete order error: " + e.getMessage());
                        request.setAttribute("error", "internal error");
                        request.getRequestDispatcher("/cart.jsp").forward(request, response);
                        return;
                    }
                    System.out.println("order error set contenuti: " + e.getMessage());
                    request.setAttribute("error", "internal error");
                    request.getRequestDispatcher("/cart.jsp").forward(request, response);
                    return;
                }
            } else {
                try {
                    dbOrder.doDelete(idOrdine);
                } catch (SQLException e) {
                    request.setCharacterEncoding("UTF-8");
                    response.setContentType("text/json");
                    response.getWriter().write("{\"error\": \"internal error\"}");
                    return;
                }
                System.out.println("quantità del prodotto troppo alta");
                request.setCharacterEncoding("UTF-8");
                response.setContentType("text/json");
                response.getWriter().write("{\"error\":" + (conte.getIdProdotto() == null || conte.getIdProdotto() == 0? conte.getIdVolume() : conte.getIdProdotto()) + "}");
                return;
            }
        }

        sCart.clear();
        sCart.push(ds);

        System.out.println("success");
        response.setStatus(200);
        response.setContentType("text/json");
        response.getWriter().println("{\"success\":\"success\"}");
    }
}

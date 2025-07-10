package controller.admin;

import controller.tools.JsonConverter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bean.*;
import model.DAO.*;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;

@WebServlet("/admin/manageorder")
public class ManageOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public ManageOrder() {
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
        HttpSession session = request.getSession();
        if (!"A".equals(session.getAttribute("logToken"))) {
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"access denied\"}");
            return;
        }

        if (!"autorizato".equals(session.getAttribute("gestureAdmin"))) {
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"access denied gestureAdmin\"}");
            return;
        }
        session.removeAttribute("gestureAdmin");

        String action = request.getParameter("actionOrder");

        if (action == null) {
            System.out.println("action is null");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
            return;
        }

        DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");

        if (action.equals("getAll")) {
            JsonConverter<OrdineBean> converter = JsonConverter.factory(OrdineBean.class, null);
            Collection<OrdineBean> ordini = null;
            OrdineDAO ordineDAO = new OrdineDAO(ds);
            String ordine = request.getParameter("ordine");
            Integer limit = request.getParameter("limit") == null ? 1 : Integer.parseInt(request.getParameter("limit"));
            Integer page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

            try {
                ordini = ordineDAO.doRetrieveAllLimit(ordine, limit, page);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            String json = "{}";
            try {
                json = converter.toJson(ordini);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(json);

        } else if (action.equals("fromDate")) {
            JsonConverter<OrdineBean> converter = JsonConverter.factory(OrdineBean.class, null);
            Collection<OrdineBean> ordini = null;
            OrdineDAO ordineDAO = new OrdineDAO(ds);
            String ordine = request.getParameter("ordine");
            String start = request.getParameter("startDate");
            String end = request.getParameter("endDate");
            Integer limit = request.getParameter("limit") == null ? 1 : Integer.parseInt(request.getParameter("limit"));
            Integer page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
            Date endDate = null;
            Date startDate = null;

            if (start == null && end == null) {
                response.setStatus(422);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid date\"}");
            }

            DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            if (start == null && end != null) {
                startDate = Date.valueOf(LocalDate.now());

                LocalDate date2 = LocalDate.parse(end, format);
                endDate = Date.valueOf(date2);
            } else if (start != null && end == null) {
                LocalDate date = LocalDate.parse(start, format);
                startDate = Date.valueOf(date);

                endDate = Date.valueOf(LocalDate.now());
            } else {
                LocalDate date = LocalDate.parse(start, format);
                startDate = Date.valueOf(date);
                LocalDate date2 = LocalDate.parse(end, format);
                endDate = Date.valueOf(date2);
            }
            if (startDate.after(endDate)) {
                response.setStatus(422);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid date\"}");
                return;
            }


            try {
                ordini = ordineDAO.doRetrieveAllByDateRange(ordine, startDate, endDate, limit, page);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            String json = "{}";
            try {
                json = converter.toJson(ordini);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(json);

        } else if (action.equals("fromUser")) {

            JsonConverter<OrdineBean> converter = JsonConverter.factory(OrdineBean.class, null);
            Collection<OrdineBean> ordini = null;
            OrdineDAO ordineDAO = new OrdineDAO(ds);
            AccountDAO accountDAO = new AccountDAO(ds);
            String ordine = request.getParameter("ordine") == null ? "" : request.getParameter("ordine");
            int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
            Integer limit = request.getParameter("limit") == null ? 1 : Integer.parseInt(request.getParameter("limit"));
            Integer page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

            try {
                ordini = ordineDAO.doRetrieveByUser(ordine, id, limit, page);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            String json = "{}";
            try {
                json = converter.toJson(ordini);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(json);

        } else if (action.equals("getContenuti")) {
            JsonConverter<ProdottoBean> converter = JsonConverter.factory(ProdottoBean.class, null);
            JsonConverter<VolumeBean> converter1 = JsonConverter.factory(VolumeBean.class, null);
            int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
            AcquistatoDAO acquistatoDAO = new AcquistatoDAO(ds);
            VolumeDAO volumeDAO = new VolumeDAO(ds);
            ProdottoDAO prodottoDAO = new ProdottoDAO(ds);
            Collection<AcquistatoBean> acquisti = null;
            Collection<ProdottoBean> prod = new ArrayList<>();
            Collection<VolumeBean> vol = new ArrayList<>();

            if (id == 0) {
                System.out.println("invalid order");
                response.setStatus(422);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid order\"}");
            }

            try {
                acquisti = acquistatoDAO.doRetrieveAllByOrder(id, null);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            for (AcquistatoBean acquistato : acquisti) {
                try {
                    System.out.println("acquistato:" + acquistato.getIdProdotto());
                    if (acquistato.getIdProdotto() != null && acquistato.getIdProdotto() > 0) {
                        ProdottoBean Prodotto = prodottoDAO.doRetrieveByKey(acquistato.getIdProdotto());
                        if (Prodotto == null) {
                            Prodotto = new ProdottoBean(0, "non presente", 0, 0.001, "nessuno", null, "prodotto vuoto");
                        } else {
                            Prodotto.setQuantita(acquistato.getqAcquistato());
                        }
                        prod.add(Prodotto);
                    } else {
                        VolumeBean Volume = volumeDAO.doRetrieveByKey(acquistato.getIdVolume());
                        if (Volume == null) {
                            Volume = new VolumeBean(0, 0, 0.0, 0, null, null, "nessuno", 0);
                        } else {
                            Volume.setQuantita(acquistato.getqAcquistato());
                        }
                        vol.add(Volume);
                    }
                } catch (SQLException e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }
            }

            for (VolumeBean volume : vol) {
                boolean prodottoPresente = prod.stream()
                        .anyMatch(prodottoBean -> prodottoBean.getIdProdotto() == volume.getIdProdotto());

                if (!prodottoPresente) {
                    ProdottoBean nuovoProdotto = null;
                    try {
                        nuovoProdotto = prodottoDAO.doRetrieveByKey(volume.getIdProdotto());
                    } catch (SQLException e) {
                        response.setStatus(500);
                        response.setContentType("text/json");
                        response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                        return;
                    }
                    if (nuovoProdotto != null) {
                        prod.add(nuovoProdotto);
                    }
                }
            }

            String jsonProd = null;
            try {
                jsonProd = converter.toJson(prod);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }
            String jsonVol = null;
            try {
                jsonVol = converter1.toJson(vol);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }
            String jsonSend = null;
            try {
                jsonSend = JsonConverter.merge(jsonProd, jsonVol);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            response.setContentType("text/json");
            response.setCharacterEncoding("UTF-8");
            assert jsonSend != null;
            response.getWriter().write(jsonSend);

        } else if (action.equals("getDip")) {
            JsonConverter<IndirizzoBean> converter = JsonConverter.factory(IndirizzoBean.class, null);
            JsonConverter<MetodoPagamentoBean> converter1 = JsonConverter.factory(MetodoPagamentoBean.class, null);
            int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
            OrdineDAO ordineDAO = new OrdineDAO(ds);
            IndirizzoDAO indirizzoDAO = new IndirizzoDAO(ds);
            MetodopagamentoDAO metodopagamentoDAO = new MetodopagamentoDAO(ds);
            OrdineBean order = null;
            IndirizzoBean indirizzo = null;
            MetodoPagamentoBean card = null;
            String jsonSend = null;
            String jsonIndirizzo = null;
            String jsonCard = null;

            try {
                order = ordineDAO.doRetrieveByKey(id);
                indirizzo = indirizzoDAO.doRetrieveByKey(order.getIdIndirizzo());
                card = metodopagamentoDAO.doRetrieveByKey(order.getIdMetodoPag());
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            try {
                jsonIndirizzo = converter.toJson(indirizzo);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            try {
                jsonCard = converter1.toJson(card);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            try {
                jsonSend = JsonConverter.merge(jsonIndirizzo, jsonCard);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            response.setContentType("text/json");
            response.setCharacterEncoding("UTF-8");
            assert jsonSend != null;
            response.getWriter().write(jsonSend);

        } else if (action.equals("delete")) {
            int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
            OrdineDAO ordineDAO = new OrdineDAO(ds);
            AcquistatoDAO acquistatoDAO = new AcquistatoDAO(ds);
            Collection<AcquistatoBean> acquistato = null;

            try {
                acquistato = acquistatoDAO.doRetrieveAllByOrder(id, null);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            for(AcquistatoBean a : acquistato) {
                try {
                    acquistatoDAO.doDelete(a.getIdAcquistato());
                } catch (SQLException e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }
            }

            try {
                ordineDAO.doDelete(id);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println("{\"success\":\"success\"}");

        } else {
            System.out.println("invalid action");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
        }
    }
}

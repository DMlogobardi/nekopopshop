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
import model.DTO.BookDTO;
import model.DTO.ProdottoDTO;
import model.DTO.VolumeDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebServlet("/common/getreader")
public class GetReader extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public GetReader() {
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
        if(session.getAttribute("logToken") == null){
            request.setAttribute("error", "utent is not logged in");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        if(session.getAttribute("gesture") != "autorizato"){
            request.setAttribute("error", "invalid request");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        session.removeAttribute("gesture");

        String acctionReader = request.getParameter("acctionReader");

        if(acctionReader.equals("getAll")){
            //mi da tutti i libiri che posso leggere
            JsonConverter<BookDTO> converter = JsonConverter.factory(BookDTO.class, null);
            DataSource ds = (DataSource) session.getAttribute("dataSource");
            int idCliente = Integer.parseInt(request.getParameter("logId"));
            ReaderDAO readerDAO = new ReaderDAO(ds);
            ProdottoDAO prodottoDAO = new ProdottoDAO(ds);
            VolumeDAO volumeDAO = new VolumeDAO(ds);
            Collection<ReaderBean> readers = null;

            try{
                readers = readerDAO.doRetrieveAllByUtent(null, idCliente);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            if(readers.isEmpty()){
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
                return;
            }

            Map<Integer, List<VolumeBean>> volumiPerProdotto = new HashMap<>();

            // 1. Raccogli tutti i volumi, raggruppati per prodotto
            for (ReaderBean reader : readers) {
                VolumeBean volume = null;
                try {
                    volume = volumeDAO.doRetrieveByKey(reader.getIdVolume());
                } catch (SQLException e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"internal error\"}");
                    return;
                }
                int idProdotto = volume.getIdProdotto();

                volumiPerProdotto
                        .computeIfAbsent(idProdotto, k -> new ArrayList<>())
                        .add(volume);
            }

            // 2. Costruisci i BookDTO
            Collection<BookDTO> books = new ArrayList<>();
            for (Map.Entry<Integer, List<VolumeBean>> entry : volumiPerProdotto.entrySet()) {
                int idProdotto = entry.getKey();
                ProdottoBean prodotto = null;
                try {
                    prodotto = prodottoDAO.doRetrieveByKey(idProdotto);
                } catch (SQLException e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"internal error\"}");
                    return;
                }
                List<VolumeBean> volumi = entry.getValue();

                books.add(new BookDTO(prodotto, volumi));
            }

            String JsonSend = "{}";
            try {
                JsonSend = converter.toJson(books);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
                return;
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(JsonSend);


        } else if (acctionReader.equals("getPages")) {
            int idCapitolo = Integer.parseInt(request.getParameter("idCapitolo"));
            JsonConverter<PaginaBean> converter = JsonConverter.factory(PaginaBean.class, null);
            DataSource ds = (DataSource) session.getAttribute("dataSource");
            int idCliente = Integer.parseInt(request.getParameter("logId"));
            ReaderDAO readerDAO = new ReaderDAO(ds);
            VolumeDAO volumeDAO = new VolumeDAO(ds);
            CapitoloDAO capitoloDAO = new CapitoloDAO(ds);
            PaginaDAO paginaDAO = new PaginaDAO(ds);
            Collection<PaginaBean> pages = null;

            if(idCapitolo <= 0){
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
                return;
            }

            try{
                CapitoloBean capitoloBean = capitoloDAO.doRetrieveByKey(idCapitolo);
                VolumeBean volume = volumeDAO.doRetrieveByKey(capitoloBean.getIdVolume());
                Collection<ReaderBean> reader = readerDAO.doRetrieveAllByUtent(null, idCliente);
                ReaderBean r = reader.stream().filter(readerBean -> readerBean.getIdVolume() == volume.getIdVolume()).findFirst().orElse(null);

                if(r == null){
                    response.setStatus(404);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"capitolo not found for user\"}");
                    return;
                }

                pages = paginaDAO.doRetrieveAllByCapitolo(null, capitoloBean.getIdCapitolo());
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
                return;
            }

            String jsonSend = "{}";
            try {
                jsonSend = converter.toJson(pages);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
                return;
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(jsonSend);

        } else if (acctionReader.equals("getCapitoli")) {
            int idVolume = Integer.parseInt(request.getParameter("idVolume"));
            JsonConverter<CapitoloBean> converter = JsonConverter.factory(CapitoloBean.class, null);
            DataSource ds = (DataSource) session.getAttribute("dataSource");
            int idCliente = Integer.parseInt(request.getParameter("logId"));
            ReaderDAO readerDAO = new ReaderDAO(ds);
            VolumeDAO volumeDAO = new VolumeDAO(ds);
            CapitoloDAO capitoloDAO = new CapitoloDAO(ds);
            Collection<CapitoloBean> cap = null;

            if(idVolume <= 0){
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
                return;
            }

            try{
                Collection<ReaderBean> reader = readerDAO.doRetrieveAllByUtent(null, idCliente);
                ReaderBean r = reader.stream().filter(readerBean -> readerBean.getIdVolume() == idVolume).findFirst().orElse(null);

                if(r == null){
                    response.setStatus(404);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"capitolo not found for user\"}");
                    return;
                }

                cap = capitoloDAO.doRetrieveAllByVol(null, idVolume);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
                return;
            }

            String jsonSend = "{}";
            try {
                jsonSend = converter.toJson(cap);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
                return;
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(jsonSend);

        } else {
            System.out.println("invalid action");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
        }
    }
}

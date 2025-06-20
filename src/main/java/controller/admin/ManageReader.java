package controller.admin;

import controller.tools.ImgByteConverter;
import controller.tools.JsonConverter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Bean.CapitoloBean;
import model.Bean.PaginaBean;
import model.DAO.CapitoloDAO;
import model.DAO.PaginaDAO;
import model.DTO.PaginaDTO;
import model.DTO.ReaderDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Optional;

/**
 * Servlet implementation class login
 */
@MultipartConfig
@WebServlet("/admin/managereader")
public class ManageReader extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public ManageReader() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        HttpSession session = request.getSession();
        if(session.getAttribute("logToken") != "A") {
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"access denied\"}");
            return;
        }

        String action = request.getParameter("action");

        if(action == null) {
            System.out.println("action is null");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
            return;
        }

        DataSource ds = (DataSource) session.getServletContext().getAttribute("dataSource");

        if(action.equals("add")) {
            JsonConverter<ReaderDTO> converter = JsonConverter.factory(ReaderDTO.class, null);
            Collection<Part> parts = request.getParts();
            Collection<Part> images = parts.stream()
                    .filter(p -> p.getSubmittedFileName() != null && p.getContentType() != null && p.getName().equals("image"))
                    .toList();
            String json = request.getParameter("json");
            Collection<ReaderDTO> readers = null;
            CapitoloDAO capitoloDAO = new CapitoloDAO(ds);
            PaginaDAO paginaDAO = new PaginaDAO(ds);

            if (json == null || json.trim().isEmpty()) {
                System.out.println("Errore: JSON nullo o vuoto");
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\" JSON nullo o vuoto\"}");
                return;
            }

            try {
                readers = converter.parseList(json);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            for (ReaderDTO reader : readers) {
                CapitoloBean cap = new CapitoloBean(
                        reader.getId(),
                        reader.getNumCapitolo(),
                        reader.getDataPub(),
                        reader.getIdVolume()
                );

                int idCapitolo;
                try {
                    idCapitolo = capitoloDAO.doSave(cap);
                } catch (SQLException e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }

                for (PaginaDTO page : reader.getPagine()) {
                    Optional<Part> imgPart = ImgByteConverter.getPartByID(images, page.getIdTavola());

                    if(imgPart.isEmpty()) {
                        request.setAttribute("errors", "image not found");
                        request.getRequestDispatcher("/admin.jsp").forward(request, response);
                        return;
                    }

                    byte[] img = ImgByteConverter.Converter(imgPart.get());
                    PaginaBean pagina = new PaginaBean(0, page.getNumPag(), img, page.getDataCaricamento(), idCapitolo);

                    try {
                        paginaDAO.doSave(pagina);
                    } catch (SQLException e) {
                        try {
                            capitoloDAO.doDelete(idCapitolo);
                        } catch (SQLException ex) {
                            response.setStatus(500);
                            response.setContentType("text/json");
                            response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                            return;
                        }
                        response.setStatus(500);
                        response.setContentType("text/json");
                        response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                        return;
                    }
                }
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println("{\"success\":\"success\"}");

        } else if (action.equals("update")) {
            String type = request.getParameter("type");
            JsonConverter<ReaderDTO> converter = JsonConverter.factory(ReaderDTO.class, null);

            if (type.equals("capitoli")) {
                CapitoloDAO capitoloDAO = new CapitoloDAO(ds);
                String json = request.getParameter("json");
                Collection<ReaderDTO> readers = null;

                if (json == null || json.trim().isEmpty()) {
                    System.out.println("Errore: JSON nullo o vuoto");
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\" JSON nullo o vuoto\"}");
                    return;
                }

                try {
                    readers = converter.parseList(json);
                } catch (Exception e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }

                for (ReaderDTO reader : readers) {
                    try {
                        capitoloDAO.uppdate(new CapitoloBean(reader.getId(), reader.getNumCapitolo(), reader.getDataPub(), reader.getIdVolume()));
                    } catch (SQLException e) {
                        response.setStatus(500);
                        response.setContentType("text/json");
                        response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                        return;
                    }
                }

                response.setStatus(200);
                response.setContentType("text/json");
                response.getWriter().println("{\"success\":\"success\"}");

            } else if (type.equals("pagine")) {
                PaginaDAO paginaDAO = new PaginaDAO(ds);
                String json = request.getParameter("json");
                Collection<Part> parts = request.getParts();
                Collection<Part> images = parts.stream()
                        .filter(p -> p.getSubmittedFileName() != null && p.getContentType() != null && p.getName().equals("image"))
                        .toList();
                ReaderDTO reader = null;

                if (json == null || json.trim().isEmpty()) {
                    System.out.println("Errore: JSON nullo o vuoto");
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\" JSON nullo o vuoto\"}");
                    return;
                }

                try {
                    reader = converter.parse(json);
                } catch (Exception e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }

                for (PaginaDTO pag : reader.getPagine()) {
                    Optional<Part> imgPart = ImgByteConverter.getPartByID(images, pag.getIdTavola());
                    PaginaBean page = null;

                    if(imgPart.isEmpty()){
                        page = new PaginaBean(0, pag.getNumPag(), null, pag.getDataCaricamento(), pag.getIdCapitolo());
                    } else {
                        byte[] img = ImgByteConverter.Converter(imgPart.get());
                        page = new PaginaBean(0, pag.getNumPag(), img, pag.getDataCaricamento(), pag.getIdCapitolo());
                    }

                    try {
                        paginaDAO.uppdate(page);
                    } catch (SQLException e) {
                        response.setStatus(500);
                        response.setContentType("text/json");
                        response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                        return;
                    }
                }

                response.setStatus(200);
                response.setContentType("text/json");
                response.getWriter().println("{\"success\":\"success\"}");

            } else {
                System.out.println("invalid type");
                response.setStatus(422);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid type\"}");
            }

        } else if (action.equals("delete")) {
            String type = request.getParameter("type");

            if (type.equals("capitoli")){
                JsonConverter<Integer> converter = JsonConverter.factory(Integer.class, null);
                CapitoloDAO capitoloDAO = new CapitoloDAO(ds);
                String json = request.getParameter("json");
                Collection<Integer> ids = null;

                if (json == null || json.trim().isEmpty()) {
                    System.out.println("Errore: JSON nullo o vuoto");
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\" JSON nullo o vuoto\"}");
                    return;
                }

                try {
                    ids = converter.parseList(json);
                } catch (Exception e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }

                for (Integer id : ids) {
                    if(id != null && id > 0) {
                        try {
                            capitoloDAO.doDelete(id);
                        } catch (SQLException e) {
                            response.setStatus(500);
                            response.setContentType("text/json");
                            response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                            return;
                        }
                    }
                }

                response.setStatus(200);
                response.setContentType("text/json");
                response.getWriter().println("{\"success\":\"success\"}");

            } else if (type.equals("pagine")) {
                JsonConverter<Integer> converter = JsonConverter.factory(Integer.class, null);
                PaginaDAO paginaDAO = new PaginaDAO(ds);
                String json = request.getParameter("json");
                Collection<Integer> ids = null;

                if (json == null || json.trim().isEmpty()) {
                    System.out.println("Errore: JSON nullo o vuoto");
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\" JSON nullo o vuoto\"}");
                    return;
                }

                try {
                    ids = converter.parseList(json);
                } catch (Exception e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }

                for (Integer id : ids) {
                    if(id != null && id > 0) {
                        try {
                            paginaDAO.doDelete(id);
                        } catch (SQLException e) {
                            response.setStatus(500);
                            response.setContentType("text/json");
                            response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                            return;
                        }
                    }
                }

                response.setStatus(200);
                response.setContentType("text/json");
                response.getWriter().println("{\"success\":\"success\"}");
            } else {
                System.out.println("invalid type");
                response.setStatus(422);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid type\"}");
            }

        } else if (action.equals("list")) {
            String type = request.getParameter("type");

            if (type.equals("capitoli")) {
                JsonConverter<CapitoloBean> converter = JsonConverter.factory(CapitoloBean.class, null);
                CapitoloDAO capitoloDAO = new CapitoloDAO(ds);
                String order = request.getParameter("order");
                int page = Integer.parseInt(request.getParameter("page"));
                Collection<CapitoloBean> capitolos = null;

                try {
                    capitolos = capitoloDAO.doRetrieveAllLimit(order, 10, page);
                } catch (SQLException e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }

                String json = "{}";
                try {
                    json = converter.toJson(capitolos);
                } catch (Exception e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }

                response.setStatus(200);
                response.setContentType("text/json");
                response.getWriter().println(json);

            } else if (type.equals("pagine")) {
                JsonConverter<PaginaBean> converter = JsonConverter.factory(PaginaBean.class, null);
                PaginaDAO paginaDAO = new PaginaDAO(ds);
                Collection<PaginaBean> pages = null;
                String order = request.getParameter("order");
                int id = Integer.parseInt(request.getParameter("cap"));

                try {
                    pages = paginaDAO.doRetrieveAllByCapitolo(order, id);
                } catch (SQLException e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }

                String json = "{}";
                try {
                    json = converter.toJson(pages);
                } catch (Exception e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }

                response.setStatus(200);
                response.setContentType("text/json");
                response.getWriter().println(json);

            } else {
                System.out.println("invalid type");
                response.setStatus(422);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid type\"}");
            }

        } else {
            System.out.println("invalid action");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
        }

    }

}
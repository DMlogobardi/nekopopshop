package controller.admin;

import controller.tools.JsonConverter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bean.ClienteBean;
import model.Bean.IndirizzoBean;
import model.Bean.NumTelefonoBean;
import model.DAO.ClienteDAO;
import model.DAO.IndirizzoDAO;
import model.DAO.NumtelefonoDAO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

@WebServlet("/admin/managecliente")
public class ManageCliente extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public ManageCliente() {
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
        if(!"A".equals(session.getAttribute("logToken"))) {
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"access denied\"}");
            return;
        }

        if(session.getAttribute("gestureAdmin") != "autorizato"){
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"access denied\"}");
            return;
        }
        session.removeAttribute("gestureAdmin");

        String action = request.getParameter("actionCliente");

        if(action == null){
            System.out.println("action is null");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
            return;
        }

        DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");

        if (action.equals("getAll")) {
            JsonConverter<ClienteBean> converter = JsonConverter.factory(ClienteBean.class, null);
            ClienteDAO clienteDAO = new ClienteDAO(ds);
            Collection<ClienteBean> clienti = null;
            String order = request.getParameter("order") == null ? "" : request.getParameter("order");
            Integer limit = request.getParameter("limit") == null ? -1 : Integer.parseInt(request.getParameter("limit"));
            Integer page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

            if(limit == null || page == null){
                response.setStatus(422);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid limit and page\"}");
                return;
            }

            try {
                if(limit != -1)
                    clienti = clienteDAO.doRetrieveAllLimit(order, limit, page);
                else
                    clienti = clienteDAO.doRetrieveAll(null);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            String json = "{}";
            try {
                json = converter.toJson(clienti);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(json);

        } else if (action.equals("getIndirizzo")) {
            JsonConverter<IndirizzoBean> converter = JsonConverter.factory(IndirizzoBean.class, null);
            IndirizzoDAO indirizzoDAO = new IndirizzoDAO(ds);
            Collection<IndirizzoBean> indirizzi = null;
            int id = Integer.parseInt(request.getParameter("id"));

            if(id <= 0 ){
                response.setStatus(422);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid cliente\"}");
            }

            try {
                indirizzi = indirizzoDAO.doRetrieveByCliente(id);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            String json = "{}";
            try {
                json = converter.toJson(indirizzi);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(json);

        } else if (action.equals("getTelefono")) {
            JsonConverter<NumTelefonoBean> converter = JsonConverter.factory(NumTelefonoBean.class, null);
            NumtelefonoDAO numtelefonoDAO= new NumtelefonoDAO(ds);
            Collection<NumTelefonoBean> numeri = null;
            int id = Integer.parseInt(request.getParameter("id"));

            if(id <= 0 ){
                response.setStatus(422);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid cliente\"}");
            }

            try {
                numeri = numtelefonoDAO.doRetrieveAllByClient(id);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            String json = "{}";
            try {
                json = converter.toJson(numeri);
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
            System.out.println("invalid action");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid actionClient\"}");
        }
    }
}

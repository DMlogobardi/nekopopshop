package controller.common;

import controller.tools.JsonConverter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bean.ClienteBean;
import model.Bean.WishlistBean;
import model.DAO.ClienteDAO;
import model.DAO.WishlistDAO;
import model.DTO.ClienteDTO;
import model.DTO.WishListDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

@WebServlet("/common/utentgesture")
public class UtentGesture extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public UtentGesture() {
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
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"access denied\"}");
            return;
        }

        if(session.getAttribute("gesture") != "autorizato"){
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"access denied\"}");
            return;
        }
        session.removeAttribute("gesture");

        String action = request.getParameter("actionUtent");
        if(action == null){
            System.out.println("action is null");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
            return;
        }

        if(action.equals("list")){
            int id = Integer.parseInt(session.getAttribute("logId").toString());
            JsonConverter<ClienteBean> converter = JsonConverter.factory(ClienteBean.class, null);
            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            ClienteDAO clienteDAO = new ClienteDAO(ds);
            ClienteBean dto = null;

            try{
                dto = clienteDAO.doRetrieveByKey(id);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            if(dto == null){
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
                return;
            }

            String json = null;
            try {
                json = converter.toJson(dto);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
                return;
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(json);
        } else if (action.equals("update")) {
            JsonConverter<ClienteDTO> converter = JsonConverter.factory(ClienteDTO.class, null);
            String json = request.getParameter("json");
            ClienteDTO dto = null;

            try{
                dto = converter.parse(json);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            int id = Integer.parseInt(session.getAttribute("logId").toString());
            ClienteDAO clienteDAO = new ClienteDAO(ds);
            ClienteBean user = null;

            try {
                user = clienteDAO.doRetrieveByKey(id);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            if(user == null){
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid user data\"}");
                return;
            }

            if(dto.getNome() != null){
                user.setNome(dto.getNome());
            }
            if(dto.getCognome() != null) {
                user.setCognome(dto.getCognome());
            }
            if(dto.getDataNascita() != null) {
                user.setDataNascita(dto.getDataNascita());
            }
            if(dto.getcF() != null && dto.getcF().length() == 16) {
                user.setcF(dto.getcF());
            }

            try{
                clienteDAO.uppdate(user, dto.getEmail());
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

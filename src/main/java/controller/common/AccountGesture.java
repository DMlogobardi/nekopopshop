package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bean.AccountBean;
import model.DAO.AccountDAO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/common/accountgesture")
public class AccountGesture extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public AccountGesture() {
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

        String action = request.getParameter("action");

        if(action == null){
            System.out.println("action is null");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
            return;
        }

        DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
        
        if(action.equals("getNick")){
            AccountDAO dao = new AccountDAO(ds);
            int id = (int) session.getAttribute("logId");
            AccountBean acc;

            try {
                acc = dao.doRetrieveByCliente(id);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            String json = "{" +
                    "\"nick\": \"" + acc.getNickName() + "\""
                    + "}";

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(json);

        } else if (action.equals("resetPassword")) {
            int id = (int) session.getAttribute("logId");
            String newPassword = request.getParameter("newPassword") == null ? "" : request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword") == null ? "" : request.getParameter("confirmPassword");
            AccountDAO accountDAO = new AccountDAO(ds);

            if(newPassword.isEmpty() || confirmPassword.isEmpty() || !newPassword.equals(confirmPassword)) {
                response.setStatus(400);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid password\"}");
            }

            String hasPassword = AccountBean.hashPassword(newPassword);

            try {
                accountDAO.updatePasswordByIdCliente(id, hasPassword);
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

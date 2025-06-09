package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import model.DAO.AccountDAO;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.IOException;
import javax.sql.DataSource;
import java.sql.SQLException;

@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountDAO accountDAO;

    public void init() throws ServletException {
        try {
            InitialContext ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/your_datasource");
            accountDAO = new AccountDAO(ds);

        } catch (NamingException e) {
            throw new ServletException("Errore DataSource", e);

        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("reset-password.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nickName = request.getParameter("nickName");
        String newPassword = request.getParameter("newPassword");

        try {
            accountDAO.updatePasswordByNickname(nickName, newPassword);
            response.sendRedirect("login.jsp?resetSuccess=true");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("reset-password.jsp?error=1");
        }
    }
}

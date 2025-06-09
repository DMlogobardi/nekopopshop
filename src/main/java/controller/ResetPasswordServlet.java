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


    public ResetPasswordServlet() {


    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("reset-password.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nickName = request.getParameter("nickName");
        String newPassword = request.getParameter("newPassword");
        DataSource dataSource = (DataSource) request.getServletContext().getAttribute("dataSource");
        AccountDAO accountDAO = new AccountDAO(dataSource);

        try {
            accountDAO.updatePasswordByNickname(nickName, newPassword);
            response.sendRedirect("login.jsp?resetSuccess=true");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("reset-password.jsp?error=1");
        }
    }
}

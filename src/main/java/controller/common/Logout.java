package controller.common;

import com.mysql.cj.xdevapi.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bean.CarrelloBean;
import model.DAO.CarrelloDAO;
import model.SessionCart;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class login
 */
@WebServlet("/common/logout")
public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public Logout() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("logToken") != null) {
            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            SessionCart sessionCart = (SessionCart) session.getAttribute("cart");

            if(sessionCart.getCarelloRefernz() == null) {
                CarrelloBean carrelloBean = new CarrelloBean();
                carrelloBean.setIdCliente((Integer) session.getAttribute("logId"));
                sessionCart.setCarelloRefernz(carrelloBean);
            }

            sessionCart.push(ds);
            session.invalidate();
            response.sendRedirect("/index.jsp");
            return;
        }

        request.setAttribute("error", "You are not logged in");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

}
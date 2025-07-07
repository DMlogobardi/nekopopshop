package controller.common;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
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
        Cookie[] c = request.getCookies();
        String res = "error";
        if (c!= null){
            for (Cookie c1 : c){
                c1.setMaxAge(1);
            }
            res = "{\"success\":\"success\"}";
        }
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
            res = "{\"success\":\"success\"}";
        }
        if(res.equals("error")) {
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"you are not logged in\"}");
        }
        else{
            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(res);
        }
    }

}
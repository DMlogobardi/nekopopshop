package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Bean.*;
import model.DAO.AccountDAO;
import model.DAO.CarrelloDAO;
import model.DAO.ContenutoDAO;
import model.DAO.VolumeDAO;
import model.SessionCart;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public Login() {
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
        if(request.getSession().getAttribute("logToken") != null) {
            request.setAttribute("errors", "utent alredy logged in");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
        AccountDAO accDB = new AccountDAO(ds);
        String pass = request.getParameter("pass");
        String nick = request.getParameter("nick");
        ArrayList<String> errors = new ArrayList<>();
        RequestDispatcher loginDispatch = request.getRequestDispatcher("login.jsp");

        if(pass == null || pass.trim().isEmpty()) {
            errors.add("the field password is empty");
        }
        if(nick == null || nick.trim().isEmpty()) {
            errors.add("the field nick is empty");
        }
        if(!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            loginDispatch.forward(request, response);
            System.out.println("errors: " + errors);
            return;
        }

        String hashPass = AccountBean.hashPassword(pass.strip());
        AccountBean acc = null;

        try {
            acc = accDB.doRetrieveByNick(nick.strip());

            if( acc != null && acc.getPassword().equals(hashPass)) {
                if(acc.isAdminFlag()){
                    request.getSession().setAttribute("logToken", "A");
                } else {
                    request.getSession().setAttribute("logToken", "C");
                }
                request.getSession().setAttribute("logId", acc.getIdCliente());
                CarrelloDAO ca = new CarrelloDAO(ds);
                ContenutoDAO in = new ContenutoDAO(ds);
                CarrelloBean cart = ca.doRetrieveByAccount(acc.getIdCliente());

                //inserisco il carrello nella sessione
                if(request.getSession().getAttribute("cart") != null) {
                    SessionCart sCart = (SessionCart) request.getSession().getAttribute("cart");
                    if(cart == null) {
                        cart = new CarrelloBean(0, 0.0, 0.0, 0, acc.getIdCliente());
                    }
                    if(!sCart.margeCart(cart, ds)){
                        errors.add("marge cart error");
                        request.setAttribute("error", errors);
                        loginDispatch.forward(request, response);
                        System.out.println("marge cart error");
                    }
                } else {
                    if(cart == null) {
                        cart = new CarrelloBean(0, 0.0, 0.0, 0, acc.getIdCliente());
                    }
                    SessionCart sCart = new SessionCart();
                    sCart.setCarelloRefernz(cart);
                    Collection<ContenutoBean> contenuti = in.doRetrieveAllproduct(cart.getIdCarello());
                    if(!contenuti.isEmpty()) {
                        sCart.setContenuti(contenuti);
                    }
                    request.getSession().setAttribute("cart", sCart);
                }

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                String success = "{\"satus\": \"success\", \"message\": \"login successful\"}";
                response.getWriter().write(success);
                System.out.println("login success");
                return;
            }

            errors.add("invalid login attempt");
            request.setAttribute("error", errors);
            loginDispatch.forward(request, response);
            System.out.println("errors: " + errors);

        } catch (SQLException e) {
            System.out.println("login servlet error: " + e.getMessage());
            errors.add("internal error");
            request.setAttribute("error", errors);
            loginDispatch.forward(request, response);
        }
    }

}
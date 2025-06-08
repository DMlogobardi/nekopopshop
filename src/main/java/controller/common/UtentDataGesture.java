package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class login
 */
@WebServlet("/common/utentdategesture")
public class UtentDataGesture extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public UtentDataGesture() {
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
        // TODO Auto-generated method stub
        HttpSession session = request.getSession();
        if(session.getAttribute("logToken") == null){
            request.setAttribute("error", "utent is not logged in");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        String action = request.getParameter("action");

        if(action == null){
            request.setAttribute("error", "invalid action");
            request.getRequestDispatcher("/utente.jsp").forward(request, response);
            return;
        }

        session.setAttribute("gesture", "autorizato");

        if(action.equals("wishlist")){
            request.getRequestDispatcher("wishlistgesture").forward(request, response);

        } else if (action.equals("indirizzi")) {
            request.getRequestDispatcher("indirizzigesture").forward(request, response);

        } else if (action.equals("carte")) {
            request.getRequestDispatcher("cartegesture").forward(request, response);

        } else if (action.equals("datiUtente")) {
            //account compreso
            request.getRequestDispatcher("utentegesture").forward(request, response);

        } else if (action.equals("ordini")) {
            request.getRequestDispatcher("ordinigesture").forward(request, response);

        } else if (action.equals("reader")) {
            request.getRequestDispatcher("getreader").forward(request, response);

        } else {
            System.out.println("error");
            request.setAttribute("error", "Invalid action");
            request.getRequestDispatcher("/utente.jsp").forward(request, response);
        }
    }

}
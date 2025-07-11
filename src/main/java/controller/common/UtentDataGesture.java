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

        if(action.equals("wishlist")){
            session.setAttribute("gesture", "autorizato");
            request.getRequestDispatcher("wishlistgesture").forward(request, response);

        } else if (action.equals("indirizzi")) {
            session.setAttribute("gesture", "autorizato");
            request.getRequestDispatcher("indirizzigesture").forward(request, response);

        } else if (action.equals("carte")) {
            session.setAttribute("gesture", "autorizato");
            request.getRequestDispatcher("cartegesture").forward(request, response);

        } else if (action.equals("datiUtente")) {
            session.setAttribute("gesture", "autorizato");
            request.getRequestDispatcher("utentgesture").forward(request, response);

        } else if (action.equals("ordini")) {
            session.setAttribute("gesture", "autorizato");
            request.getRequestDispatcher("ordinigesture").forward(request, response);

        } else if (action.equals("reader")) {
            session.setAttribute("gesture", "autorizato");
            request.getRequestDispatcher("getreader").forward(request, response);

        } else {
            System.out.println("invalid action");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");;
        }
    }

}
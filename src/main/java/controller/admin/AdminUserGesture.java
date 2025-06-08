package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/admin/admindatagesture")
public class AdminUserGesture extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public AdminUserGesture() {
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
        if(session.getAttribute("logToken") != "A") {
            request.setAttribute("errors", "access denied");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        String action = request.getParameter("action");

        if(action == null){
            request.setAttribute("error", "invalid action");
            request.getRequestDispatcher("/utente.jsp").forward(request, response);
            return;
        }

        session.setAttribute("gestureAdmin", "autorizato");

        if(action.equals("order")){
            request.getRequestDispatcher("manageorder").forward(request, response);
        } else if (action.equals("cliente")) {
            request.getRequestDispatcher("managecliente").forward(request, response);
        } else {
            System.out.println("error");
            request.setAttribute("error", "Invalid action");
            request.getRequestDispatcher("/utente.jsp").forward(request, response);
        }

    }
}

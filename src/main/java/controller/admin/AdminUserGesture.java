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
        if(!"A".equals(session.getAttribute("logToken"))) {
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"access denied\"}");
            return;
        }

        String action = request.getParameter("action");

        if(action == null){
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"access denied gesture\"}");
            return;
        }

        if(action.toLowerCase().strip().equals("order")){
            session.setAttribute("gestureAdmin", "autorizato");
            request.getRequestDispatcher("manageorder").forward(request, response);
        } else if (action.toLowerCase().strip().equals("cliente")) {
            session.setAttribute("gestureAdmin", "autorizato");
            request.getRequestDispatcher("managecliente").forward(request, response);
        } else {
            System.out.println("invalid action");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
        }

    }
}

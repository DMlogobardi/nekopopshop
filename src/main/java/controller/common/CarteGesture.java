package controller.common;

import controller.tools.JsonConverter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bean.MetodoPagamentoBean;
import model.DAO.MetodopagamentoDAO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

@WebServlet("/common/cartegesture")
public class CarteGesture extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public CarteGesture() {
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
        if(session.getAttribute("logToken") == null){
            request.setAttribute("error", "utent is not logged in");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        if(session.getAttribute("gesture") != "autorizato"){
            request.setAttribute("error", "invalid request");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        session.removeAttribute("gesture");

        String action = request.getParameter("actionCard");
        if(action == null){
            request.setAttribute("error", "invalid action");
            request.getRequestDispatcher("/utente.jsp").forward(request, response);
            return;
        }

        if(action.equals("add")){
            String json = request.getParameter("json");
            JsonConverter<MetodoPagamentoBean> converter = JsonConverter.factory(MetodoPagamentoBean.class, null);
            Collection<MetodoPagamentoBean> card = null;

            try{
                card = (Collection<MetodoPagamentoBean>) converter.parseList(json);
            } catch (Exception e){
                try{
                    card = new ArrayList<MetodoPagamentoBean>();
                    card.add(converter.parse(json));
                } catch (Exception e1){
                    System.out.println("error add: " + e.getMessage() + "second error: " + e1.getCause());
                    request.setAttribute("error", "server error");
                    request.getRequestDispatcher("/utente.jsp").forward(request, response);
                    return;
                }
            }

            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            int idCliente = (int) session.getAttribute("logId");
            MetodopagamentoDAO metodopagamentoDAO = new MetodopagamentoDAO(ds);
            for(MetodoPagamentoBean carta : card){
                carta.setIdCliente(idCliente);

                try {
                    metodopagamentoDAO.doSave(carta);
                } catch (SQLException e) {
                    System.out.println("error add: " + e.getMessage());
                    request.setAttribute("error", "server error");
                    request.getRequestDispatcher("/utente.jsp").forward(request, response);
                    return;
                }
            }

            System.out.println("add success");
            request.setAttribute("success", "success");
            request.getRequestDispatcher("/utente.jsp").forward(request, response);

        } else if(action.equals("delete")){
            String json = request.getParameter("json");
            JsonConverter<MetodoPagamentoBean> converter = JsonConverter.factory(MetodoPagamentoBean.class, null);
            Collection<MetodoPagamentoBean> card = null;

            try{
                card = (Collection<MetodoPagamentoBean>) converter.parseList(json);
            } catch (Exception e){
                try{
                    card = new ArrayList<MetodoPagamentoBean>();
                    card.add(converter.parse(json));
                } catch (Exception e1){
                    System.out.println("error delete: " + e.getMessage() + "second error: " + e1.getCause());
                    request.setAttribute("error", "server error");
                    request.getRequestDispatcher("/utente.jsp").forward(request, response);
                    return;
                }
            }

            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            int idCliente = (int) session.getAttribute("logId");
            MetodopagamentoDAO metodopagamentoDAO = new MetodopagamentoDAO(ds);
            for(MetodoPagamentoBean carta : card){
                try {
                    metodopagamentoDAO.doDeleteByIdAndCliente(carta.getIdMetodoPagamento(), idCliente);
                } catch (SQLException e) {
                    System.out.println("error delete: " + e.getMessage());
                    request.setAttribute("error", "server error");
                    request.getRequestDispatcher("/utente.jsp").forward(request, response);
                    return;
                }
            }

            System.out.println("delete success");
            request.setAttribute("success", "success");
            request.getRequestDispatcher("/utente.jsp").forward(request, response);

        } else if(action.equals("list")){
            JsonConverter<MetodoPagamentoBean> converter = JsonConverter.factory(MetodoPagamentoBean.class, null);
            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            int idCliente = (int) session.getAttribute("logId");
            MetodopagamentoDAO metodopagamentoDAO = new MetodopagamentoDAO(ds);
            Collection<MetodoPagamentoBean> card = null;

            try {
                card = metodopagamentoDAO.doRetrieveByCliente(idCliente);
            } catch (SQLException e) {
                System.out.println("list error: " + e.getMessage());
                request.setAttribute("error", "server error");
                request.getRequestDispatcher("/utente.jsp").forward(request, response);
                return;
            }

            String json = null;
            try {
                json = converter.toJson(card);
            } catch (Exception e) {
                System.out.println("list pars error: " + e.getMessage());
                request.setAttribute("error", "server error");
                request.getRequestDispatcher("/utente.jsp").forward(request, response);
                return;
            }

            System.out.println("success");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);

        } else {
            request.setAttribute("error", "invalid action");
            request.getRequestDispatcher("/utente.jsp").forward(request, response);
        }
    }
}

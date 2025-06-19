package controller.common;

import controller.tools.JsonConverter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bean.OrdineBean;
import model.DAO.OrdineDAO;
import model.DTO.OrderDTO;
import model.DTO.WishListDTO;
import model.DTO.deleteOrderDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Collection;

public class OrdiniGesture extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * Default constructor.
     */
    public OrdiniGesture() {
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

        String action = request.getParameter("actionOrdini");
        if(action == null){
            request.setAttribute("error", "invalid action");
            request.getRequestDispatcher("/utente.jsp").forward(request, response);
            return;
        }

        if(action.equals("annulla")){
            JsonConverter<deleteOrderDTO> converter = JsonConverter.factory(deleteOrderDTO.class, null);
            String json = request.getParameter("json");
            Collection<deleteOrderDTO> dto = null;

            try{
                dto = converter.parseList(json);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
            }

            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            OrdineDAO ordineDAO = new OrdineDAO(ds);
            for(deleteOrderDTO dto1 : dto) {
                OrdineBean order = null;
                try {
                    order = ordineDAO.doRetrieveByKey(dto1.getOrderId());
                } catch (SQLException e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                }

                LocalDate d1 = LocalDate.parse(order.getDataOrdine());
                LocalDate d2 = LocalDate.parse(order.getDataArrivo());
                long diffDays = Math.abs(java.time.temporal.ChronoUnit.DAYS.between(d1, d2));
                if(d1.isEqual(d2) || diffDays == 1){
                    response.setStatus(409);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"order already delivered\"}");
                }

                try {
                    ordineDAO.doDelete(dto1.getOrderId());
                } catch (SQLException e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                }
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println("{\"success\":\"success\"}");

        } else if (action.equals("list")) {
            int page = Integer.parseInt(request.getParameter("page"));
            String order = request.getParameter("order");
            JsonConverter<OrdineBean> converter = JsonConverter.factory(OrdineBean.class, null);
            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            OrdineDAO ordineDAO = new OrdineDAO(ds);
            Collection<OrdineBean> ordini = null;

            try{
                ordini = ordineDAO.doRetrieveAllLimit(order, 10, page);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
            }

            if(ordini == null){
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
            }

            String json = null;
            try {
                json = converter.toJson(ordini);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(json);

        } else {
            System.out.println("invalid action");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
        }
    }
}

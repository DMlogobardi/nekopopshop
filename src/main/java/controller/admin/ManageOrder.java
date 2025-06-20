package controller.admin;

import controller.tools.JsonConverter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bean.AccountBean;
import model.Bean.OrdineBean;
import model.DAO.AccountDAO;
import model.DAO.OrdineDAO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Collection;

@WebServlet("/admin/manageorder")
public class ManageOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public ManageOrder() {
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
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"access denied\"}");
            return;
        }

        if(session.getAttribute("gestureAdmin") != "autorizato"){
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"access denied\"}");
            return;
        }
        session.removeAttribute("gestureAdmin");

        String action = request.getParameter("actionOrder");

        if(action == null){
            System.out.println("action is null");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
            return;
        }

        DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
        
        if(action.equals("getAll")){
            JsonConverter<OrdineBean> converter = JsonConverter.factory(OrdineBean.class, null);
            Collection<OrdineBean> ordini = null;
            OrdineDAO ordineDAO = new OrdineDAO(ds);
            String ordine = request.getParameter("ordine");
            Integer limit = Integer.parseInt(request.getParameter("limit"));
            Integer page = Integer.parseInt(request.getParameter("page"));

            if(limit == null || page == null){
                response.setStatus(422);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid limit and page\"}");
                return;
            }

            try {
                ordini = ordineDAO.doRetrieveAllLimit(ordine, limit, page);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            String json = "{}";
            try {
                json = converter.toJson(ordini);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(json);

        } else if (action.equals("fromDate")) {
            JsonConverter<OrdineBean> converter = JsonConverter.factory(OrdineBean.class, null);
            Collection<OrdineBean> ordini = null;
            OrdineDAO ordineDAO = new OrdineDAO(ds);
            String ordine = request.getParameter("ordine");
            String start = request.getParameter("startDate");
            String end = request.getParameter("endDate");
            Date endDate = null;
            Date startDate = null;

            if(start == null && end == null){
                response.setStatus(422);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid date\"}");
            }

            DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            if(start == null && end != null){
                startDate = Date.valueOf(LocalDate.now());

                LocalDate date2 =LocalDate.parse(end, format);
                endDate = Date.valueOf(date2);
            }else if(start != null && end == null){
                LocalDate date =LocalDate.parse(start, format);
                startDate = Date.valueOf(date);

                endDate = Date.valueOf(LocalDate.now());
            } else {
                LocalDate date =LocalDate.parse(start, format);
                startDate = Date.valueOf(date);
                LocalDate date2 =LocalDate.parse(end, format);
                endDate = Date.valueOf(date2);
            }
            if(startDate.after(endDate)){
                response.setStatus(422);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"invalid date\"}");
                return;
            }


            try {
                ordini = ordineDAO.doRetrieveAllByDateRange(ordine, startDate, endDate);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            String json = "{}";
            try {
                json = converter.toJson(ordini);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println(json);

        } else if (action.equals("fromUser")) {

            JsonConverter<OrdineBean> converter = JsonConverter.factory(OrdineBean.class, null);
            Collection<OrdineBean> ordini = null;
            OrdineDAO ordineDAO = new OrdineDAO(ds);
            AccountDAO accountDAO = new AccountDAO(ds);
            String ordine = request.getParameter("ordine");
            String nickname = request.getParameter("nick");

            try {
                AccountBean acc = accountDAO.doRetrieveByNick(nickname);
                if(acc == null){
                    response.setStatus(422);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"invalid account\"}");
                    return;
                }
                ordini = ordineDAO.doRetrieveByUser(ordine, acc.getIdCliente());
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            String json = "{}";
            try {
                json = converter.toJson(ordini);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
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

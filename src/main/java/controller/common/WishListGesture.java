package controller.common;

import controller.tools.JsonConverter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bean.WishlistBean;
import model.DAO.ProdottoDAO;
import model.DAO.VolumeDAO;
import model.DAO.WishlistDAO;
import model.DTO.ProdottoDTO;
import model.DTO.WishListDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

@WebServlet("/common/wishlistgesture")
public class WishListGesture extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public WishListGesture() {
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
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"access denied\"}");
            return;
        }

        if(session.getAttribute("gesture") != "autorizato"){
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"access denied\"}");
            return;
        }
        session.removeAttribute("gesture");

        String action = request.getParameter("actionWishList");
        if(action == null){
            System.out.println("action is null");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
            return;
        }

        if(action.equals("add")){
            JsonConverter<WishListDTO> converter = JsonConverter.factory(WishListDTO.class, null);
            String json = request.getParameter("json");
            Collection<WishListDTO> dto = null;

            try{
                dto = converter.parseList(json);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            WishlistDAO wishlistDAO = new WishlistDAO(ds);
            ProdottoDAO prodottoDAO = new ProdottoDAO(ds);
            VolumeDAO volumeDAO = new VolumeDAO(ds);
            for(WishListDTO wishListDTO : dto){
                Boolean exists = false;
                try {
                    if (wishListDTO.getIdProdotto() != 0 || wishListDTO.getIdVolume() != null) {
                        if (prodottoDAO.doRetrieveByKey(wishListDTO.getIdProdotto()) != null) {
                            exists = true;
                        }
                    } else {
                        if (volumeDAO.doRetrieveByKey(wishListDTO.getIdVolume()) != null) {
                            exists = true;
                        }
                    }

                    if (exists) {
                        wishlistDAO.doSave(new WishlistBean(0, wishListDTO.getIdProdotto(), wishListDTO.getIdCliente(), wishListDTO.getIdVolume()));
                    }
                } catch (SQLException e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println("{\"success\":\"success\"}");

        } else if (action.equals("remove")){
            JsonConverter<WishListDTO> converter = JsonConverter.factory(WishListDTO.class, null);
            String json = request.getParameter("json");
            Collection<WishListDTO> dto = null;

            try{
                dto = converter.parseList(json);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            WishlistDAO wishlistDAO = new WishlistDAO(ds);
            for(WishListDTO wishListDTO : dto){
                try{
                    wishlistDAO.doDelete(wishListDTO.getIdWishList());
                } catch (SQLException e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println("{\"success\":\"success\"}");

        } else if (action.equals("update")) {
            JsonConverter<WishListDTO> converter = JsonConverter.factory(WishListDTO.class, null);
            String json = request.getParameter("json");
            Collection<WishListDTO> dto = null;

            try{
                dto = converter.parseList(json);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            WishlistDAO wishlistDAO = new WishlistDAO(ds);
            for(WishListDTO wishListDTO : dto){
                try{
                    wishlistDAO.uppdate(new WishlistBean(wishListDTO.getIdWishList(), wishListDTO.getIdProdotto(), wishListDTO.getIdCliente(), wishListDTO.getIdVolume()));
                } catch (SQLException e) {
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }
            }

            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println("{\"success\":\"success\"}");

        } else if (action.equals("list")){
            int page = Integer.parseInt(request.getParameter("page"));
            String order = request.getParameter("order");
            JsonConverter<WishlistBean> converter = JsonConverter.factory(WishlistBean.class, null);
            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            WishlistDAO wishlistDAO = new WishlistDAO(ds);
            Collection<WishlistBean> dto = null;

            try{
                dto = wishlistDAO.doRetrieveAllLimit(order, 10, page);
            } catch (SQLException e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            if(dto == null){
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
                return;
            }

            String json = null;
            try {
                json = converter.toJson(dto);
            } catch (Exception e) {
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"internal error\"}");
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

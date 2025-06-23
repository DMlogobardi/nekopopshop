package controller;

import controller.tools.JsonConverter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Bean.ProdottoBean;
import model.Bean.VolumeBean;
import model.DAO.ProdottoDAO;
import model.DAO.VolumeDAO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.stream.Collectors;

/**
 * Servlet implementation class login
 */
@WebServlet("/getcatalog")
public class GetCatalog extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public GetCatalog() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			DataSource ds = (DataSource) request.getServletContext().getAttribute("dataSource");
			ProdottoDAO prodDB = new ProdottoDAO(ds);
			VolumeDAO volDB = new VolumeDAO(ds);
			Collection<ProdottoBean> dbPrd = null;
			Collection<VolumeBean> dbVol = new LinkedList<VolumeBean>();
			String serch = request.getParameter("serch");
			System.out.println("serch: " + serch);
			String filter = request.getParameter("filter");
			int page = request.getParameter("page") == null ? 0 : Integer.parseInt(request.getParameter("page"));
			String dayProduct = request.getParameter("dayProduct");
			int limit = request.getParameter("limit") == null ? 10 : Integer.parseInt(request.getParameter("limit"));

			if(dayProduct.equals("ok")) {
				VolumeBean vol = volDB.doRetrieveByKey(1);
				dbPrd = new LinkedList<>();
				dbPrd.add(prodDB.doRetrieveByKey(vol.getIdProdotto()));
				dbVol.add(vol);

			} else if (dayProduct.equals("figure")){
				dbPrd = new LinkedList<>();
				dbPrd.add(prodDB.doRetrieveFigure());
			} else {
				//logica di filtri
				if (serch == null && filter == null) {

					dbPrd = prodDB.doRetrieveAllLimit("idProdotto", limit, page);

				} else if (serch != null && filter == null) {

					dbPrd = prodDB.doRetrieveAllLimitLike("nome", limit, page, serch.toLowerCase());
					for (ProdottoBean pb : dbPrd) {
						if (pb.getPrezzo() == 0.0) {
							dbVol.addAll(volDB.doRetrieveAllByProduct(pb.getIdProdotto(), serch));
						}
					}

				} else if (serch == null) {
					System.out.println("filter: " + filter);
					if (filter.equals("volumi")) {
						String order = request.getParameter("order");
						String volFilter = request.getParameter("tag");
						dbVol = volDB.doRetrieveAllLimitByType(order, limit, page, volFilter);

					} else {
						dbPrd = prodDB.doRetrieveAllLimit(filter.strip(), limit, page);
					}
				} else {
					System.out.println("filter + serch");
					if (filter.equals("volumi")) {
						String volFilter = request.getParameter("volFilter");
						dbVol = volDB.doRetrieveAllLimit(volFilter.strip(), limit, page, serch.toLowerCase());

					} else {
						dbPrd = prodDB.doRetrieveAllLimitLike(filter.strip(), limit, page, serch.toLowerCase());
					}
				}
			}

			// invio dei json
			if(dbVol.isEmpty() && dbPrd != null && !dbPrd.isEmpty()) {
				for (ProdottoBean pb : dbPrd) {
					if (pb.getPrezzo() == 0.0) {
						dbVol.add(volDB.doRetrieveByProduct(pb.getIdProdotto()));
					}
				}
				JsonConverter<ProdottoBean> prodConverter = JsonConverter.factory(ProdottoBean.class, null);
				String jsonProd = prodConverter.toJson(dbPrd);
				String jsonSend = null;
				if(!dbVol.isEmpty()) {
					JsonConverter<VolumeBean> volConverter = JsonConverter.factory(VolumeBean.class, null);
					String jsonVol = volConverter.toJson(dbVol);
					jsonSend = JsonConverter.merge(jsonProd, jsonVol);
				}
				response.setContentType("text/json");
				response.setCharacterEncoding("UTF-8");
				if(jsonSend != null) {
					System.out.println("if JsonSend: " + jsonSend);
					response.getWriter().write(jsonSend);
				} else {
					System.out.println("if JsonProd: " + jsonProd);
					response.getWriter().write(jsonProd);
				}
			} else if (dbPrd == null || dbPrd.isEmpty()) {
				JsonConverter<VolumeBean> volConverter = JsonConverter.factory(VolumeBean.class, null);
				String jsonVol = volConverter.toJson(dbVol);
				System.out.println("else JsonVol: " + jsonVol);

				response.setContentType("text/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonVol);

			} else {
				JsonConverter<ProdottoBean> prodConverter = JsonConverter.factory(ProdottoBean.class, null);
				String jsonProd = prodConverter.toJson(dbPrd);
				System.out.println("else JsonProd: " + jsonProd);
				JsonConverter<VolumeBean> volConverter = JsonConverter.factory(VolumeBean.class, null);
				String jsonVol = volConverter.toJson(dbVol);
				System.out.println("else JsonVol: " + jsonVol);

				String jsonSend = JsonConverter.merge(jsonProd, jsonVol);
				System.out.println("else: " + jsonSend);

				response.setContentType("text/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonSend);

			}
		} catch (SQLException e){
			System.out.println("getCatalog servlet error: " + e.getMessage());
			response.setStatus(500);
			response.setContentType("text/json");
			response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
			return;
		} catch (Exception e) {
			System.out.println("getCatalog servlet parse error: " + e.getMessage());
			response.setStatus(500);
			response.setContentType("text/json");
			response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
			return;
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
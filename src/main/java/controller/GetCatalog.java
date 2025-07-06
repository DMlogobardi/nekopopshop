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
import java.util.List;
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
			int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
			String dayProduct = request.getParameter("dayProduct") == null ? "" : request.getParameter("dayProduct");
			int limit = request.getParameter("limit") == null ? 10 : Integer.parseInt(request.getParameter("limit"));
			String tot = request.getParameter("tot") == null ? "" : request.getParameter("tot");
			String productType = request.getParameter("productType") == null ? "" : request.getParameter("productType");

			if(tot.equals("tot")){
				if(productType.equals("prod")) {
					int totale = prodDB.doRetrieveTot();
					System.out.println("totale 1: " + totale);
					response.setContentType("text/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write("{ \"totale\": " + totale + "}");
					return;
				} else {
					int totale = volDB.doRetrieveTot();
					System.out.println("totale 2: " + totale);
					response.setContentType("text/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write("{ \"totale\": " + totale + "}");
					return;
				}
			} else if (tot.equals("serch")){
				if(productType.equals("prod")) {
					System.out.println("serch");
					int totale = prodDB.doRetrieveAllLimitLikeTot(serch.strip());
					System.out.println("totale serch: " + totale);
					response.setContentType("text/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write("{ \"totale\": " + totale + "}");
					return;
				} else {
					System.out.println("serch");
					int totale = volDB.doRetrieveAllLimitTot(serch.strip());
					System.out.println("totale serch: " + totale);
					response.setContentType("text/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write("{ \"totale\": " + totale + "}");
					return;
				}
			}

			if(id > 0){
				if(productType.equals("prod")) {
					dbPrd = new LinkedList<ProdottoBean>();
					dbPrd.add(prodDB.doRetrieveByKey(id));
				} else {
					dbVol.add(volDB.doRetrieveByKey(id));
				}
			} else if (dayProduct.equals("ok")) {
				if(productType.equals("vol")) {
					VolumeBean vol = volDB.doRetrieveByKey(1);
					dbPrd = new LinkedList<>();
					dbPrd.add(prodDB.doRetrieveByKey(vol.getIdProdotto()));
					dbVol.add(vol);
				} else {
					dbPrd = prodDB.doRetrieveAllLimit(null, 1, 1);
				}

			} else if (dayProduct.equals("figure")){
				dbPrd = new LinkedList<>();
				dbPrd.add(prodDB.doRetrieveFigure());
			} else {
				//logica di filtri
				if (serch == null && filter == null) {
					if(productType.equals("prod")) {
						dbPrd = prodDB.doRetrieveAllLimit(null, limit, page);
					} else {
						dbVol = volDB.doRetrieveAllLimit(null, limit, page);
					}
				} else if (serch != null && filter == null) {
					if(productType.equals("prod")) {
						dbPrd = prodDB.doRetrieveAllLimitLike(null, limit, page, serch.strip());
					} else {
						dbVol = volDB.doRetrieveAllLimit(null, limit, page, serch.strip());
					}
				} else if (serch == null) {
					if (productType.equals("vol")) {
						String categoria = request.getParameter("categoria") == null ? "" : request.getParameter("categoria");
						if(categoria.equals("")){
							dbVol = volDB.doRetrieveAllLimit(filter, limit, page);
						} else {
							dbVol = volDB.doRetrieveAllLimitByType(filter, limit, page, categoria);
						}
					} else {
						dbPrd = prodDB.doRetrieveAllLimit(filter.strip(), limit, page);
					}
				} else {
					System.out.println("filter + serch");
					if (productType.equals("vol")) {
						String categoria = request.getParameter("categoria") == null ? "shonen" : request.getParameter("categoria");
						dbVol = volDB.doRetrieveAllLimitByType(filter, limit, page, serch.toLowerCase(), categoria);

					} else {
						dbPrd = prodDB.doRetrieveAllLimitLike(filter.strip(), limit, page, serch.toLowerCase());
					}
				}
			}

			// invio dei json
			if(dbVol.isEmpty() && dbPrd != null && !dbPrd.isEmpty()) {
				JsonConverter<ProdottoBean> prodConverter = JsonConverter.factory(ProdottoBean.class, null);
				String jsonProd = prodConverter.toJson(dbPrd);
				response.setContentType("text/json");
				response.setCharacterEncoding("UTF-8");
				System.out.println("if JsonProd: " + jsonProd);
				response.getWriter().write(jsonProd);

			} else if (dbPrd == null || dbPrd.isEmpty()) {
				int curentid = 0;
				dbPrd = new LinkedList<>();
				for(VolumeBean vol : dbVol) {
					if(vol.getIdProdotto() != curentid) {
						dbPrd.add(prodDB.doRetrieveByKey(vol.getIdProdotto()));
					}
				}

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
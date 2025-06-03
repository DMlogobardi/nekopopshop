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

			if(serch==null && filter == null) {
				dbPrd = prodDB.doRetrieveAllLimit("idProdotto", 10, page);
				dbVol = volDB.doRetrieveAllLimit("idVolume", 10, page);
			} else if(serch!=null && filter == null) {
				dbPrd = prodDB.doRetrieveAllLimitLike("nome", 10, page, serch.toLowerCase());
				for(ProdottoBean pb : dbPrd) {
					if (pb.getPrezzo() == 0.0) {
						dbVol.addAll(volDB.doRetrieveAllByProduct(pb.getIdProdotto(), serch));
					}
				}
			} else if (serch == null) {
				System.out.println("filter");
				if(filter.equals("volumi")){
					dbVol = volDB.doRetrieveAllLimit("idVolume", 10, page);
				} else {
					dbPrd = prodDB.doRetrieveAllLimit(filter.strip(), 10, page);
				}
			} else {
				System.out.println("filter + serch");
				if(filter.equals("volumi")){
					dbVol = volDB.doRetrieveAllLimit("idVolume", 10, page, serch.toLowerCase());
				} else {
					dbPrd = prodDB.doRetrieveAllLimitLike(filter.strip(), 10, page, serch.toLowerCase());
				}
			}
			if(dbVol.isEmpty() && dbPrd != null && !dbPrd.isEmpty()) {
				for (ProdottoBean pb : dbPrd) {
					if (pb.getPrezzo() == null) {
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
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				if(jsonSend != null) {
					response.getWriter().write(jsonSend);
				} else {
					response.getWriter().write(jsonProd);
				}
				return;
			}
			if(!dbVol.isEmpty() && dbPrd != null && !dbPrd.isEmpty()){
				JsonConverter<ProdottoBean> prodConverter = JsonConverter.factory(ProdottoBean.class, null);
				String jsonProd = prodConverter.toJson(dbPrd);
				JsonConverter<VolumeBean> volConverter = JsonConverter.factory(VolumeBean.class, null);
				String jsonVol = volConverter.toJson(dbVol);

				String jsonSend = JsonConverter.merge(jsonProd, jsonVol);

				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonSend);
				return;
			}
			request.setAttribute("error", "404 Not Found");
			request.getRequestDispatcher("getcatalog.jsp").forward(request, response);

		} catch (SQLException e){
			System.out.println("getCatalog servlet error: " + e.getMessage());
			request.setAttribute("error", "internal server error");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("getCatalog servlet parse error: " + e.getMessage());
			request.setAttribute("error", "internal server error");
			request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
	/*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DataSource ds = (DataSource) request.getServletContext().getAttribute("dataSource");
			ProdottoDAO prodDB = new ProdottoDAO(ds);
			VolumeDAO volDB = new VolumeDAO(ds);

			Collection<ProdottoBean> prodotti = new LinkedList<>();
			Collection<VolumeBean> volumi = new LinkedList<>();

			String serch = request.getParameter("serch");
			String filter = request.getParameter("filter") == null ? "" : request.getParameter("filter").toLowerCase();
			int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

			if ((serch == null || serch.isEmpty()) && filter.isEmpty()) {
				// Nessuna ricerca né filtro: prendi paginato prodotti e volumi
				prodotti = prodDB.doRetrieveAllLimit("idProdotto", 10, page);
				volumi = volDB.doRetrieveAllLimit("idVolume", 10, page);
			} else if (filter.equals("volumi") && serch != null && !serch.isEmpty()) {
				// Filtro volumi + ricerca: prendi tutti i volumi matching con serch (nome+numero)
				volumi = volDB.doRetrieveAllLimit("nome", 10, page, serch.toLowerCase());

				// estrai gli idProdotto distinti dai volumi trovati
				Collection<Integer> prodottiIds = new LinkedList<>();
				for (VolumeBean v : volumi) {
					if (!prodottiIds.contains(v.getIdProdotto())) {
						prodottiIds.add(v.getIdProdotto());
					}
				}

				// prendi tutti i prodotti associati a quegli idProdotto
				for (Integer idProd : prodottiIds) {
					ProdottoBean p = prodDB.doRetrieveByKey(idProd);
					if (p != null) {
						prodotti.add(p);
					}
				}
			} else if (serch != null && !serch.isEmpty() && filter.isEmpty()) {
				// Ricerca senza filtro: cerca prodotti per nome LIKE
				prodotti = prodDB.doRetrieveAllLimitLike("nome", 10, page, serch.toLowerCase());

				// per ogni prodotto che ha prezzo null (volume), prendi TUTTI i volumi associati a quel prodotto
				for (ProdottoBean p : prodotti) {
					if (p.getPrezzo() == null) {
						Collection<VolumeBean> volumiAssoc = volDB.doRetrieveAllByProduct(p.getIdProdotto());
						if (volumiAssoc != null && !volumiAssoc.isEmpty()) {
							volumi.addAll(volumiAssoc);
						}
					}
				}
			} else if (!filter.isEmpty()) {
				// filtro altri o solo prodotti con paginazione
				if (filter.equals("volumi")) {
					volumi = volDB.doRetrieveAllLimit("idVolume", 10, page);
				} else {
					prodotti = prodDB.doRetrieveAllLimit(filter.strip(), 10, page);
				}
			}

			// Risposta JSON
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			if (!prodotti.isEmpty() && !volumi.isEmpty()) {
				// entrambi presenti: merge JSON
				JsonConverter<ProdottoBean> prodConverter = JsonConverter.factory(ProdottoBean.class, null);
				String jsonProd = prodConverter.toJson(prodotti);

				JsonConverter<VolumeBean> volConverter = JsonConverter.factory(VolumeBean.class, null);
				String jsonVol = volConverter.toJson(volumi);

				String jsonSend = JsonConverter.merge(jsonProd, jsonVol);
				response.getWriter().write(jsonSend);
			} else if (!prodotti.isEmpty()) {
				JsonConverter<ProdottoBean> prodConverter = JsonConverter.factory(ProdottoBean.class, null);
				String jsonProd = prodConverter.toJson(prodotti);
				response.getWriter().write(jsonProd);
			} else if (!volumi.isEmpty()) {
				JsonConverter<VolumeBean> volConverter = JsonConverter.factory(VolumeBean.class, null);
				String jsonVol = volConverter.toJson(volumi);
				response.getWriter().write(jsonVol);
			} else {
				// Nessun risultato
				request.setAttribute("error", "404 Not Found");
				request.getRequestDispatcher("getcatalog.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			System.out.println("getCatalog servlet error: " + e.getMessage());
			request.setAttribute("error", "internal server error");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("getCatalog servlet parse error: " + e.getMessage());
			request.setAttribute("error", "internal server error");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
		*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
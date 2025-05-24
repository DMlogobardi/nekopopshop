package controller;

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
			String filter = request.getParameter("filter") == null ? "" : request.getParameter("filter").toLowerCase();
			int page = request.getParameter("page") == null ? 0 : Integer.parseInt(request.getParameter("page"));

			if(serch==null && filter.isEmpty()) {
				dbPrd = prodDB.doRetrieveAllLimit("idProdotto", 10, page);
			} else if(serch!=null && filter.isEmpty()) {
				dbPrd = prodDB.doRetrieveAllLimitLike("nome", 10, page, serch.toLowerCase());
			} else if (serch == null) {
				if(filter.equals("volumi")){
					dbVol = volDB.doRetrieveAllLimit("idVolume", 10, page);
				} else {
					dbPrd = prodDB.doRetrieveAllLimit(filter.strip(), 10, page);
				}
			} else {
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
				request.setAttribute("prodotti", dbPrd);
				if(!dbVol.isEmpty())
					request.setAttribute("volumi", dbVol);
				request.getRequestDispatcher("getcatalog.jsp").forward(request, response);
				return;
			}
			if(!dbVol.isEmpty() && dbPrd != null && !dbPrd.isEmpty()){
				request.setAttribute("prodotti", dbPrd);
				request.setAttribute("volumi", dbVol);
				request.getRequestDispatcher("getcatalog.jsp").forward(request, response);
				return;
			}
			request.setAttribute("error", "404 Not Found");
			request.getRequestDispatcher("getcatalog.jsp").forward(request, response);

		} catch (SQLException e){
			System.out.println("getCatalog servlet error: " + e.getMessage());
			request.setAttribute("error", "internal server error");
			request.getRequestDispatcher("index.jsp").forward(request, response);
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
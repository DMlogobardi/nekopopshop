package controller.admin;

import controller.tools.ImgByteConverter;
import controller.tools.JsonConverter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Bean.ProdottoBean;
import model.Bean.VolumeBean;
import model.DAO.ProdottoDAO;
import model.DAO.VolumeDAO;
import model.DTO.*;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Servlet implementation class login
 */
@MultipartConfig
@WebServlet("/admin/manageproduct")
public class ManageCatalog extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public ManageCatalog() {
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
        // TODO Auto-generated method stub
        HttpSession session = request.getSession();
        if(session.getAttribute("logToken") != "A") {
            request.setAttribute("errors", "access denied");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        String action = request.getParameter("action");

        if(action == null) {
            request.setAttribute("errors", "access denied");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        DataSource ds = (DataSource) session.getServletContext().getAttribute("ds");

        if(action.equals("insert")) {
            JsonConverter<ManageCatalogDTO> converter = JsonConverter.factory(ManageCatalogDTO.class, request.getReader());
            Collection<Part> images = (Collection<Part>) request.getParts();
            Collection<ProdottoBean> prodotti;
            Collection<VolumeBean> volume;

            try {
                ManageCatalogDTO dati = converter.parse();
                ProdottoDAO prodDB = new ProdottoDAO(ds);
                VolumeDAO volDB = new VolumeDAO(ds);
                ProdottoBean pro = null;
                VolumeBean vol = null;

                for (ProdottoDTO prod : dati.getProdotti()){
                    VolumeDTO volDTO = null;
                    if(prod.getPrezzo() == null){
                        volDTO = (VolumeDTO) dati.getVolumi().stream().filter(v -> v.getIdProd() == prod.getIdTempVolume());
                        Optional<Part> imgPart = ImgByteConverter.getPartByID(images, volDTO.getIdImg());

                        if(imgPart.isEmpty()) {
                            request.setAttribute("errors", "image not found");
                            request.getRequestDispatcher("index.jsp").forward(request, response);
                            return;
                        }

                        byte[] img = ImgByteConverter.Converter(imgPart.get());
                        vol = new VolumeBean(0, volDTO.getNumVolume(), volDTO.getPrezzo(), volDTO.getQuantita(), volDTO.getDatapubl(), img, 0);
                    }

                    if(volDTO != null){
                        int id;
                        pro = new ProdottoBean(0, prod.getNome(), null, null, prod.getAutor(), null , prod.getDescrizzione());
                        id = prodDB.doSave(pro);
                        
                        vol.setIdProdotto(id);
                        volDB.doSave(vol);
                    } else {
                        Optional<Part> prodImg = ImgByteConverter.getPartByID(images, prod.getIdImg());
                        byte[] img = ImgByteConverter.Converter(prodImg.get());
                        
                        pro = new ProdottoBean(0, prod.getNome(), prod.getQuantita(), prod.getPrezzo(), prod.getAutor(), img , prod.getDescrizzione());
                        prodDB.doSave(pro);
                    }
                }
                
                request.setAttribute("success", "success");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
                
            } catch (Exception e) {
                System.out.println("ManageCatalog servlet DTO pars error: " + e.getMessage());
                request.setAttribute("errors", "internal error");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
            
        } else if (action.equals("delete")) {
            JsonConverter<DeletElementCatalogDTO> converter = JsonConverter.factory(DeletElementCatalogDTO.class, request.getReader());
            DeletElementCatalogDTO delete;
            ArrayList<String> sqlErrors = new ArrayList<>();
            
            try {
                delete = converter.parse();
            } catch (Exception e) {
                System.out.println("ManageCatalog servlet DTO pars error: " + e.getMessage());
                request.setAttribute("errors", "internal error");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }

            ProdottoDAO prodDB = new ProdottoDAO(ds);
            VolumeDAO volDB = new VolumeDAO(ds);
            
            for(IdClassDTO element : delete.getIds()){
                try{
                    if(element.getTipo().equals("Prodotto")){
                        prodDB.doDelete(element.getId());
                    } else if(element.getTipo().equals("Volume")){
                        volDB.doDelete(element.getId());
                    }
                } catch (SQLException e) {
                    sqlErrors.add(e.getMessage());
                }
            }
            
            if(!sqlErrors.isEmpty()){
                System.out.println("ManageCatalog servlet sql delete error: " + sqlErrors.toString());
                request.setAttribute("errors", sqlErrors);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
            
            request.setAttribute("success", "success");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            String update = request.getParameter("update");

            if(update.equals("prodotto")) {
                Part image = (Part) request.getParts();
                JsonConverter<ProdottoDTO> converter = JsonConverter.factory(ProdottoDTO.class, request.getReader());
                ProdottoDTO prod = null;

                try {
                    prod = converter.parse();
                } catch (Exception e) {
                    System.out.println("ManageCatalog servlet DTO pars error: " + e.getMessage());
                    request.setAttribute("errors", "internal error");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    return;
                }

                ProdottoDAO prodDB = new ProdottoDAO(ds);
                byte[] img = ImgByteConverter.Converter(image);
                ProdottoBean prd = new ProdottoBean(0, prod.getNome(), prod.getQuantita(), prod.getPrezzo(), prod.getAutor(), img, prod.getDescrizzione());

                try{
                    prodDB.uppdate(prd);
                } catch (SQLException e) {
                    System.out.println("ManageCatalog servlet sql uppdate error: " + e.getMessage());
                    request.setAttribute("errors", "internal error");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    return;
                }

                request.setAttribute("success", "success");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            System.out.println("ManageCatalog wrong action");
            request.setAttribute("errors", "internal error");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

}
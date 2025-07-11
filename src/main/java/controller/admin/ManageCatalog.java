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

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        HttpSession session = request.getSession();
        if(!"A".equals(session.getAttribute("logToken"))) {
            System.out.println("session is not admin " + session.getServletContext().getAttribute("logToken"));
            request.setAttribute("errors", "access denied");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        String action = request.getParameter("action");

        if(action == null) {
            System.out.println("action is null");
            request.setAttribute("errors", "access denied");
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
            return;
        }

        DataSource ds = (DataSource) session.getServletContext().getAttribute("dataSource");
        System.out.println(ds);

        if(action.equals("insert")) {
            System.out.println("insert");
            JsonConverter<ManageCatalogDTO> converter = JsonConverter.factory(ManageCatalogDTO.class, null);
            Collection<ProdottoBean> prodotti;
            Collection<VolumeBean> volume;

            try {
                String json = request.getParameter("json");
                if (json == null || json.trim().isEmpty()) {
                    System.out.println("Errore: JSON nullo o vuoto");
                    request.setAttribute("errors", "json error");
                    request.getRequestDispatcher("/admin.jsp").forward(request, response);
                    return;
                }

                Collection<Part> parts = (Collection<Part>) request.getParts();
                Collection<Part> images = parts.stream()
                        .filter(p -> p.getSubmittedFileName() != null && p.getContentType() != null && p.getName().equals("image"))
                        .toList();
                ManageCatalogDTO dati = converter.parse(json.strip());
                ProdottoDAO prodDB = new ProdottoDAO(ds);
                VolumeDAO volDB = new VolumeDAO(ds);
                ProdottoBean pro = null;
                VolumeBean vol = null;


                for (ProdottoDTO prod : dati.getProdotti()){
                    VolumeDTO volDTO = null;
                    if(prod.getPrezzo() == null){
                        volDTO = dati.getVolumi().stream().filter(v -> v.getIdProd() == prod.getIdTempVolume()).findFirst().orElse(null);
                        if (volDTO == null) {
                            request.setAttribute("errors", "volume not found");
                            request.getRequestDispatcher("/admin.jsp").forward(request, response);
                            return;
                        }

                        Optional<Part> imgPart = ImgByteConverter.getPartByID(images, volDTO.getIdImg());

                        if(imgPart.isEmpty()) {
                            request.setAttribute("errors", "image not found");
                            request.getRequestDispatcher("/admin.jsp").forward(request, response);
                            return;
                        }

                        byte[] img = ImgByteConverter.Converter(imgPart.get());
                        vol = new VolumeBean(0, volDTO.getNumVolume(), volDTO.getPrezzo(), volDTO.getQuantita(), volDTO.getDatapubl(), img, volDTO.getTag(),0);
                    }

                    if(volDTO != null){
                        int id;
                        pro = new ProdottoBean(0, prod.getNome(), null, null, prod.getAutor(), null , prod.getDescrizzione());
                        id = prodDB.doSave(pro);
                        
                        vol.setIdProdotto(id);
                        volDB.doSave(vol);
                    } else {
                        Optional<Part> prodImg = ImgByteConverter.getPartByID(images, prod.getIdImg());
                        if(prodImg.isEmpty()) {
                            request.setAttribute("errors", "image not found");
                            request.getRequestDispatcher("/admin.jsp").forward(request, response);
                            return;
                        }

                        byte[] img = ImgByteConverter.Converter(prodImg.get());
                        
                        pro = new ProdottoBean(0, prod.getNome(), prod.getQuantita(), prod.getPrezzo(), prod.getAutor(), img , prod.getDescrizzione());
                        prodDB.doSave(pro);
                    }
                }
                if (dati.getVolumi() != null) {
                    for (VolumeDTO volDTO : dati.getVolumi()) {
                        Optional<Part> volImg = ImgByteConverter.getPartByID(images, volDTO.getIdImg());
                        if (volImg.isEmpty()) {
                            request.setAttribute("errors", "image not found");
                            request.getRequestDispatcher("/admin.jsp").forward(request, response);
                            return;
                        }

                        byte[] img = ImgByteConverter.Converter(volImg.get());
                        vol = new VolumeBean(0, volDTO.getNumVolume(), volDTO.getPrezzo(), volDTO.getQuantita(), volDTO.getDatapubl(), img, volDTO.getTag(),volDTO.getIdProd());
                        volDB.doSave(vol);
                    }
                }

                System.out.println("ManageCatalog servlet insert success");
                request.setAttribute("success", "success");
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
                return;
                
            } catch (Exception e) {
                System.out.println("ManageCatalog servlet DTO pars error: " + e.getMessage());
                request.setAttribute("errors", "internal error");
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
                return;
            }
            
        } else if (action.equals("delete")) {
            JsonConverter<DeletElementCatalogDTO> converter = JsonConverter.factory(DeletElementCatalogDTO.class, null);
            String json = request.getParameter("json");
            DeletElementCatalogDTO delete;
            ArrayList<String> sqlErrors = new ArrayList<>();
            
            try {
                delete = converter.parse(json);
            } catch (Exception e) {
                System.out.println("ManageCatalog servlet DTO pars error: " + e.getMessage());
                request.setAttribute("errors", "internal error");
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
                return;
            }

            ProdottoDAO prodDB = new ProdottoDAO(ds);
            VolumeDAO volDB = new VolumeDAO(ds);
            ArrayList<Boolean> result = new ArrayList<Boolean>();
            for(IdClassDTO element : delete.getIds()){
                try{
                    if(element.getTipo().equals("prodotto")){
                      result.add(prodDB.doDelete(element.getId()));
                    } else if(element.getTipo().equals("volume")){
                      result.add(volDB.doDelete(element.getId()));
                    }
                } catch (SQLException e) {
                    sqlErrors.add(e.getMessage());
                }
            }
            
            if(!sqlErrors.isEmpty()){
                System.out.println("ManageCatalog servlet sql delete error: " + sqlErrors.toString());
                request.setAttribute("errors", sqlErrors);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
                return;
            }

            System.out.println("ManageCatalog servlet delete success");
            request.setAttribute("success", "success");
            request.setAttribute("quary_result", result);
            request.getRequestDispatcher("/admin.jsp").forward(request, response);

        } else if (action.equals("edit")) {
            //qui usiamo idTempVolume come id per il prodotto, !SOLO QUI!

            String update = request.getParameter("update");

            if(update.equals("prodotto")) {
                Part image = request.getPart("image"); // può essere null
                JsonConverter<ProdottoDTO> converter = JsonConverter.factory(ProdottoDTO.class, null);
                String json = request.getParameter("json");
                ProdottoDTO prod = null;

                try {
                    prod = converter.parse(json);
                } catch (Exception e) {
                    System.out.println("ManageCatalog servlet DTO parse error (Prodotto): " + e.getMessage());
                    request.setAttribute("errors", "internal error");
                    request.getRequestDispatcher("/admin.jsp").forward(request, response);
                    return;
                }

                ProdottoDAO prodDB = new ProdottoDAO(ds);
                byte[] img = null;
                if (image != null && image.getSize() > 0) {
                    img = ImgByteConverter.Converter(image);
                }

                ProdottoBean prd = new ProdottoBean(
                        prod.getIdTempVolume(),
                        prod.getNome(),
                        prod.getQuantita(),
                        prod.getPrezzo(),
                        prod.getAutor(),
                        img,
                        prod.getDescrizzione()
                );

                try {
                    prodDB.uppdate(prd);
                } catch (SQLException e) {
                    System.out.println("ManageCatalog servlet SQL update error (Prodotto): " + e.getMessage());
                    request.setAttribute("errors", "internal error");
                    request.getRequestDispatcher("/admin.jsp").forward(request, response);
                    return;
                }

                System.out.println("ManageCatalog servlet update success");
                request.setAttribute("success", "success");
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            }

            if(update.equals("volume")) {
                Part image = request.getPart("image");
                JsonConverter<VolumeDTO> converter = JsonConverter.factory(VolumeDTO.class, null);
                String json = request.getParameter("json");
                VolumeDTO vol = null;

                try {
                    vol = converter.parse(json);
                } catch (Exception e) {
                    System.out.println("ManageCatalog servlet DTO parse error (Volume): " + e.getMessage());
                    request.setAttribute("errors", "internal error");
                    request.getRequestDispatcher("/admin.jsp").forward(request, response);
                    return;
                }

                VolumeDAO volDB = new VolumeDAO(ds);
                byte[] img = null;
                if (image != null && image.getSize() > 0) {
                    img = ImgByteConverter.Converter(image);
                }

                VolumeBean vbean = new VolumeBean(
                        0,
                        vol.getNumVolume(),
                        vol.getPrezzo(),
                        vol.getQuantita(),
                        vol.getDatapubl(),
                        img,
                        vol.getTag(),
                        vol.getIdProd()
                );

                try {
                    volDB.uppdate(vbean);
                } catch (SQLException e) {
                    System.out.println("ManageCatalog servlet SQL update error (Volume): " + e.getMessage());
                    request.setAttribute("errors", "internal error");
                    request.getRequestDispatcher("/admin.jsp").forward(request, response);
                    return;
                }

                System.out.println("ManageCatalog servlet update success");
                request.setAttribute("success", "success");
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            }


        } else {
            System.out.println("ManageCatalog wrong action");
            request.setAttribute("errors", "internal error");
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
        }

    }

}
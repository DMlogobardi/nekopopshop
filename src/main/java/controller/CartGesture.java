package controller;

import controller.tools.JsonConverter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bean.CarrelloBean;
import model.Bean.ContenutoBean;
import model.Bean.ProdottoBean;
import model.Bean.VolumeBean;
import model.DAO.CarrelloDAO;
import model.DAO.ProdottoDAO;
import model.DAO.VolumeDAO;
import model.DTO.ContenutoDTO;
import model.SessionCart;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/cartgesture")
public class CartGesture extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public CartGesture() {
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
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            SessionCart sCart = new SessionCart();
            request.getSession().setAttribute("cart", sCart);
        }

        String action = request.getParameter("action");
        if (action == null) {
            System.out.println("action is null");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
            return;
        }

        SessionCart sCart = (SessionCart) session.getAttribute("cart");

        if(sCart.getCarelloRefernz() == null && session.getAttribute("logToken") != null){
            System.out.println("cart");
            System.out.println(sCart.getCarelloRefernz());
            int id = (int) session.getAttribute("logId");
            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            CarrelloDAO DAOcart = new CarrelloDAO(ds);

            try {
                sCart.setCarelloRefernz(DAOcart.doRetrieveByAccount(id));
            } catch (SQLException e) {
                System.out.println("error cart referencise: " + e.getMessage());
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }


        } else if (sCart.getCarelloRefernz() == null) {
                System.out.println("cart");
                CarrelloBean carrelloBean = new CarrelloBean();
                System.out.println(carrelloBean.getIdCliente());
                sCart.setCarelloRefernz(carrelloBean);
        }

        //add
        if (action.equals("add")) {
            String jsonAdd = request.getParameter("json");
            JsonConverter<ContenutoDTO> converter = JsonConverter.factory(ContenutoDTO.class, null);
            Collection<ContenutoDTO> addDTO = null;

            System.out.println("jsonAdd: " + jsonAdd);
            if (jsonAdd == null || jsonAdd.isEmpty()) {
                response.setStatus(400);
                response.getWriter().println("{\"error\":\"Parametro 'prodotto' mancante o vuoto\"}");
                return;
            }

            try {
                addDTO = (Collection<ContenutoDTO>) converter.parseList(jsonAdd);

            } catch (Exception e) {
                try {
                    addDTO = new ArrayList<ContenutoDTO>();
                    addDTO.add(converter.parse(jsonAdd));
                } catch (Exception e1) {
                    System.out.println("add delete: " + e.getMessage() + " second error: " + e1.getCause());
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }
            }

            Boolean prodNotAdd = false;
            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            for (ContenutoDTO dto : addDTO) {
                if(sCart.getProdotti().stream().filter(p->p.getIdProdotto() == dto.getIdProdotto()).count() == 0) {
                    ProdottoDAO prodottoSQL = new ProdottoDAO(ds);
                    VolumeDAO volumeSQL = new VolumeDAO(ds);
                    double tot = 0.0;

                    try {
                        if (dto.getIdProdotto() != null && dto.getIdProdotto() != 0) {
                            tot += prodottoSQL.doRetrievePrezzoByKey(dto.getIdProdotto())*dto.getqCarrello();
                        } else {
                            tot += volumeSQL.doRetrievePrezzoByKey(dto.getIdVolume())*dto.getqCarrello();
                        }
                    } catch (SQLException e) {
                        System.out.println("error add: " + e.getMessage());
                        response.setStatus(500);
                        response.setContentType("text/json");
                        response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                        return;
                    }

                    CarrelloBean carrello = sCart.getCarelloRefernz();
                    double totRef = (carrello == null || carrello.getTot() == null) ? 0.0 : carrello.getTot();
                    sCart.getCarelloRefernz().setTot(totRef + tot);
                    sCart.addPrd(new ContenutoBean(0, dto.getqCarrello(), dto.getIdCarrello(), dto.getIdProdotto(), dto.getIdVolume()));
                } else {
                    prodNotAdd = true;
                }
            }

            System.out.println("add success");
            response.setStatus(200);
            response.setContentType("text/json");
            if(prodNotAdd)
                response.getWriter().println("{\"success\":\"many prod not add\"}");
            else
                response.getWriter().println("{\"success\":\"success\"}");

        } else if (action.equals("update")) {
            //update
            String jsonAdd = request.getParameter("json");
            JsonConverter<ContenutoDTO> converter = JsonConverter.factory(ContenutoDTO.class, null);
            Collection<ContenutoDTO> updateDTO = null;

            try {
                updateDTO = (Collection<ContenutoDTO>) converter.parseList(jsonAdd);
            } catch (Exception e) {
                try {
                    updateDTO = new ArrayList<ContenutoDTO>();
                    updateDTO.add(converter.parse(jsonAdd));
                } catch (Exception e1) {
                    System.out.println("error delete: " + e.getMessage() + "second error: " + e1.getCause());
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }
            }

            for(ContenutoDTO dto : updateDTO) {
                DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
                ProdottoDAO prodottoSQL = new ProdottoDAO(ds);
                VolumeDAO volumeSQL = new VolumeDAO(ds);
                double dbprice = 0.0;

                try {
                    if (dto.getIdProdotto() != null && dto.getIdProdotto() != 0) {
                        dbprice = prodottoSQL.doRetrievePrezzoByKey(dto.getIdProdotto());
                    } else {
                        dbprice = volumeSQL.doRetrievePrezzoByKey(dto.getIdVolume());
                    }
                } catch (SQLException e) {
                    System.out.println("error update: " + e.getMessage());
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }
                if (dto.getIdProdotto() != null && dto.getIdProdotto() != 0) {
                    double finalDbprice = dbprice;
                    sCart.getContenuti().stream().filter(conte -> conte.getIdProdotto() == dto.getIdProdotto()).findFirst().ifPresent(conte -> {
                        Double tot = sCart.getCarelloRefernz().getTot();
                        tot = tot - (conte.getqCarrello() * finalDbprice);
                        conte.setqCarrello(dto.getqCarrello());
                        Double newToto = tot + (dto.getqCarrello() * finalDbprice);
                        sCart.setCarrelloRefernzTot(Math.round(newToto * 100.0) / 100.0);
                    });
                } else {
                    double finalDbprice = dbprice;
                    sCart.getContenuti().stream().filter(conte -> conte.getIdVolume() == dto.getIdVolume()).findFirst().ifPresent(conte -> {
                        Double tot = sCart.getCarelloRefernz().getTot();
                        tot = tot - (conte.getqCarrello() * finalDbprice);
                        conte.setqCarrello(dto.getqCarrello());
                        Double newToto = tot + (dto.getqCarrello() * finalDbprice);
                        sCart.setCarrelloRefernzTot(Math.round(newToto * 100.0) / 100.0);
                    });
                }
            }



            System.out.println("update success");
            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println("{\"success\":\"success\"}");

        } else if (action.equals("delete")) {
            //delete
            String jsonRemove = request.getParameter("json");
            JsonConverter<ContenutoDTO> converter = JsonConverter.factory(ContenutoDTO.class, null);
            Collection<ContenutoDTO> removeDTO = null;
            System.out.println(jsonRemove);

            try {
                removeDTO  = (Collection<ContenutoDTO>) converter.parseList(jsonRemove);
            } catch (Exception e) {
                try {
                    removeDTO = new ArrayList<ContenutoDTO>();
                    removeDTO.add(converter.parse(jsonRemove));
                } catch (Exception e1) {
                    System.out.println("error delete: " + e.getMessage() + "second error: " + e1.getCause());
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }
            }

            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            for (ContenutoDTO dto : removeDTO) {
                ProdottoDAO prodottoSQL = new ProdottoDAO(ds);
                VolumeDAO volumeSQL = new VolumeDAO(ds);
                double tot = 0.0;
                try {
                    if (dto.getIdProdotto() != null && dto.getIdProdotto() != 0) {
                        tot += prodottoSQL.doRetrievePrezzoByKey(dto.getIdProdotto());
                    } else {
                        tot += volumeSQL.doRetrievePrezzoByKey(dto.getIdVolume());
                    }
                } catch (SQLException e) {
                    System.out.println("error delete: " + e.getMessage());
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }

                if (dto.getIdProdotto() != null && dto.getIdProdotto() != 0) {
                    double finalTot = tot;
                    sCart.getContenuti().stream().filter(conte -> Objects.equals(conte.getIdProdotto(), dto.getIdProdotto())).findFirst().ifPresent(conte -> {
                        double totRef = sCart.getCarelloRefernz().getTot();
                        double newTot = totRef - (finalTot*conte.getqCarrello());
                        sCart.setCarrelloRefernzTot(Math.round(newTot * 100.0) / 100.0);
                        sCart.removeProdByProd(dto.getIdProdotto());
                    });
                } else {
                    double finalTot = tot;
                    sCart.getContenuti().stream().filter(conte -> conte.getIdVolume() == dto.getIdVolume()).findFirst().ifPresent(conte -> {
                        double totRef = sCart.getCarelloRefernz().getTot();
                        double newTot = totRef - (finalTot*conte.getqCarrello());
                        sCart.setCarrelloRefernzTot(Math.round(newTot * 100.0) / 100.0);
                        sCart.removeProdByVol(dto.getIdVolume());
                    });
                }
            }

            sCart.push(ds);

            System.out.println("remove success");
            response.setStatus(200);
            response.setContentType("text/json");
            response.getWriter().println("{\"success\":\"success\"}");

        } else if (action.equals("list")) {
            //get all
            String offset = request.getParameter("offset");
            if(offset == null || offset.equals("")) {
                System.out.println("add offset parameter");
                request.setAttribute("error", "add offset parameter");
                request.getRequestDispatcher("cart.jsp").forward(request, response);
                return;
            }
            Collection<ContenutoBean> contuti = sCart.getProdottiByLimit(3, Integer.parseInt(offset));

            DataSource ds = (DataSource) getServletContext().getAttribute("dataSource");
            VolumeDAO volDAO = new VolumeDAO(ds);
            ProdottoDAO proDAO = new ProdottoDAO(ds);
            Collection<VolumeBean> volDB = new LinkedList<VolumeBean>();
            Collection<ProdottoBean> proDB = new LinkedList<ProdottoBean>();

            for (ContenutoBean dto : contuti) {
                System.out.println(dto.getIdProdotto());
                if (dto.getIdProdotto() != null && dto.getIdProdotto() != 0) {
                    try {
                        ProdottoBean temp = proDAO.doRetrieveByKey(dto.getIdProdotto());
                        temp.setQuantita(dto.getqCarrello());
                        temp.setPrezzo(temp.getPrezzo() * dto.getqCarrello());
                        proDB.add(temp);
                    } catch (SQLException e) {
                        System.out.println("error list prod: " + e.getMessage());
                        response.setStatus(500);
                        response.setContentType("text/json");
                        response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                        return;
                    }
                } else {
                    try {
                        VolumeBean temp = volDAO.doRetrieveByKey(dto.getIdVolume());
                        temp.setQuantita(dto.getqCarrello());
                        temp.setPrezzo(temp.getPrezzo() * dto.getqCarrello());
                        if(proDB.stream().filter(p -> p.getIdProdotto() == temp.getIdProdotto()).count() == 0) {
                            proDB.add(proDAO.doRetrieveByKey(temp.getIdProdotto()));
                        }
                        volDB.add(temp);
                    } catch (SQLException e) {
                        System.out.println("error list vol: " + e.getMessage());
                        response.setStatus(500);
                        response.setContentType("text/json");
                        response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                        return;
                    }
                }
            }


            JsonConverter<VolumeBean> converterVol = JsonConverter.factory(VolumeBean.class, null);
            String jsonVol = null;
            JsonConverter<ProdottoBean> converterProd = JsonConverter.factory(ProdottoBean.class, null);
            String jsonProd = null;
            String jsonSend = null;

            try {
                jsonVol = converterVol.toJson(volDB);
                jsonProd = converterProd.toJson(proDB);
                System.out.println();
            } catch (Exception e) {
                System.out.println("error list: " + e.getMessage());
                response.setStatus(500);
                response.setContentType("text/json");
                response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            if(!jsonProd.equals("[]") && !jsonVol.equals("[]")) {
                try {
                    jsonSend = JsonConverter.merge(jsonProd, jsonVol);
                } catch (Exception e) {
                    System.out.println("error list marge: " + e.getMessage());
                    response.setStatus(500);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"" + e.getMessage() + "\"}");
                    return;
                }
            } else if(jsonProd.equals("[]") && !jsonVol.equals("[]")) {
                jsonSend = jsonVol;
            } else if(jsonVol.equals("[]") && !jsonProd.equals("[]")) {
                jsonSend = jsonProd;
            }

            if (jsonSend == null) {
                jsonSend = "[]";
            }

            System.out.println("success");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonSend);

        } else if (action.equals("setSconti")) {
            //set sconti
            String code = request.getParameter("code");
            if (code != null) {
                String regex = "NeKo_(\\d+)_PoP_ShoP";

                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(code);
                int valoreCoupon = 0;

                if (matcher.find()) {
                    valoreCoupon = Integer.parseInt(matcher.group(1));
                    if(valoreCoupon > 0 && valoreCoupon <= 50) {
                        sCart.getCarelloRefernz().setSconti(valoreCoupon);
                    } else {
                        System.out.println("Codice non valido");
                        response.setStatus(422);
                        response.setContentType("text/json");
                        response.getWriter().println("{\"error\":\"invalid code\"}");
                        return;
                    }

                } else {
                    System.out.println("Codice non valido");
                    response.setStatus(422);
                    response.setContentType("text/json");
                    response.getWriter().println("{\"error\":\"invalid code\"}");
                    return;
                }
                System.out.println("Codice valido");
                response.setStatus(200);
                response.setContentType("text/json");
                response.getWriter().println("{\"success\":"+ valoreCoupon + "}");
                return;
            }
            System.out.println("error setSconto");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid code\"}");
            return;
        } else if (action.equals("element")) {
            response.setContentType("text/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(200);
            response.getWriter().write("{\"success\":"+ sCart.getContenuti().size() + "}");
        } else if (action.equals("cartTotals")) {
            CarrelloBean cart = sCart.getCarelloRefernz();
            String json = "{\"tot\":" + cart.getTot() + ",\"speseSped\":" + cart.getSpeseSped() + ",\"sconti\":" + cart.getSconti() + "}";
            response.setContentType("text/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(200);
            response.getWriter().write(json);
        } else {
            System.out.println("error");
            response.setStatus(422);
            response.setContentType("text/json");
            response.getWriter().println("{\"error\":\"invalid action\"}");
        }
    }
}

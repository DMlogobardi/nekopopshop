package model;

import model.Bean.CarrelloBean;
import model.Bean.ContenutoBean;
import model.Bean.ProdottoBean;
import model.DAO.CarrelloDAO;
import model.DAO.ContenutoDAO;
import model.DAO.ProdottoDAO;
import model.DAO.VolumeDAO;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Objects;
import java.util.Optional;

public class SessionCart {
    private Collection<ContenutoBean> contenuti;
    private CarrelloBean carelloRefernz;

    public SessionCart() {
        this.contenuti = new ArrayList<ContenutoBean>();
    }

    // Aggiungi questo getter
    public Collection<ContenutoBean> getContenuti() {
        return this.contenuti;
    }

    // Mantieni gli altri metodi esistenti
    public void addPrd(ContenutoBean prod) {
        if(prod != null) {
            this.contenuti.add(prod);
        }
    }

    public int removeProd(int idCont) {
        if(contenuti.removeIf(cont -> cont.getIdContenuto() == idCont))
            return 1;
        return 0;
    }

    public int removeProdByProd(int idCont) {
        if(contenuti.removeIf(cont -> cont.getIdProdotto() != null && cont.getIdProdotto() == idCont))
            return 1;
        return 0;
    }

    public int removeProdByVol(int idCont) {
        if(contenuti.removeIf(cont -> cont.getIdVolume() != null &&  cont.getIdVolume() == idCont))
            return 1;
        return 0;
    }

    public ContenutoBean getProd(int idCont) {
        if(idCont >= 0)
            return this.contenuti.stream()
                .filter(cont -> cont.getIdContenuto() == idCont)
                .findFirst()
                .orElse(null);
        return null;
    }

    public Collection<ContenutoBean> getProdotti() {
        return contenuti;
    }

    public Collection<ContenutoBean> getProdottiByLimit(int limit, int offset) {
        if(limit > 0 && offset >= 0) {
            return new ArrayList<>(this.contenuti)
                .subList(Math.min(offset, contenuti.size()), 
                        Math.min(offset + limit, contenuti.size()));
        }
        return null;
    }

    public CarrelloBean getCarelloRefernz() {
        return carelloRefernz;
    }

    public void setCarrelloRefernzTot(Double tot){
        this.carelloRefernz.setTot(tot);
    }

    public void setCarelloRefernz(CarrelloBean carelloRefernz) {
        if(carelloRefernz != null)
            this.carelloRefernz = carelloRefernz;
    }

    public Boolean upadteReference(DataSource ds) throws SQLException {
        Boolean ris = false;
        if(this.carelloRefernz != null && carelloRefernz.getTot() <= 0.0 ) {
            carelloRefernz.setTot(0.0);
            double tot = 0.0;

            ProdottoDAO prodottoSQL = new ProdottoDAO(ds);
            VolumeDAO volumeSQL = new VolumeDAO(ds);
            for (ContenutoBean contenuto : this.contenuti) {
                if(contenuto.getIdProdotto() != 0){
                    tot += prodottoSQL.doRetrievePrezzoByKey(contenuto.getIdProdotto());
                } else {
                    tot += volumeSQL.doRetrievePrezzoByKey(contenuto.getIdProdotto());
                }
            }
        }

        return ris;
    }

    public void setContenuti(Collection<ContenutoBean> contenuti) {
        if(contenuti != null)
            this.contenuti = contenuti;
    }

    public void push(DataSource ds) {
        CarrelloDAO cartSQL = new CarrelloDAO(ds);
        int idCart = 0;
        try {
            ContenutoDAO contSQL = new ContenutoDAO(ds);

            if(this.carelloRefernz.getIdCarello() > 0) {
                contSQL.doDeleteByCart(this.carelloRefernz.getIdCarello());
                cartSQL.doDelete(this.carelloRefernz.getIdCarello());
            }

            idCart = cartSQL.doSave(this.carelloRefernz);

            for(ContenutoBean contenuto : this.contenuti) {
                contenuto.setIdCarrello(idCart);
                contSQL.doSave(contenuto);
            }
        } catch (SQLException e) {
            try {
                cartSQL.doDelete(idCart);
            } catch (SQLException ex) {
                System.out.println("Error " + e.getMessage());
            }
            System.out.println("Error " + e.getMessage());
        }
    }

    public Boolean margeCart(CarrelloBean dbCart, DataSource ds) throws SQLException {
        if (dbCart == null || ds == null) {
            return false;
        }

        ContenutoDAO contenutoSQL = new ContenutoDAO(ds);
        Collection<ContenutoBean> dbContenuto = contenutoSQL.doRetrieveAllproduct(dbCart.getIdCarello());

        for (ContenutoBean contenutoDB : dbContenuto) {
            Optional<ContenutoBean> match = this.contenuti.stream()
                    .filter(conte ->
                            Objects.equals(conte.getIdProdotto(), contenutoDB.getIdProdotto()) &&
                                    Objects.equals(conte.getIdVolume(), contenutoDB.getIdVolume()))
                    .findFirst();

            if (match.isPresent()) {
                ContenutoBean sessionConte = match.get();
                int nuovaQuantita = sessionConte.getqCarrello() + contenutoDB.getqCarrello();

                double prezzoUnitario;
                if (contenutoDB.getIdProdotto() != 0) {
                    ProdottoDAO prodottoSQL = new ProdottoDAO(ds);
                    prezzoUnitario = prodottoSQL.doRetrievePrezzoByKey(contenutoDB.getIdProdotto());
                } else {
                    VolumeDAO volumeSQL = new VolumeDAO(ds);
                    prezzoUnitario = volumeSQL.doRetrievePrezzoByKey(contenutoDB.getIdVolume());
                }

                sessionConte.setqCarrello(nuovaQuantita);
                this.carelloRefernz.setTot(this.carelloRefernz.getTot() + (prezzoUnitario * contenutoDB.getqCarrello()));
            } else {
                this.contenuti.add(contenutoDB);

                double prezzoUnitario;
                if (contenutoDB.getIdProdotto() != 0) {
                    ProdottoDAO prodottoSQL = new ProdottoDAO(ds);
                    prezzoUnitario = prodottoSQL.doRetrievePrezzoByKey(contenutoDB.getIdProdotto());
                } else {
                    VolumeDAO volumeSQL = new VolumeDAO(ds);
                    prezzoUnitario = volumeSQL.doRetrievePrezzoByKey(contenutoDB.getIdVolume());
                }

                this.carelloRefernz.setTot(this.carelloRefernz.getTot() + (prezzoUnitario * contenutoDB.getqCarrello()));
            }
        }

        this.carelloRefernz.setIdCarello(dbCart.getIdCarello());
        this.carelloRefernz.setSconti(Math.max(dbCart.getSconti(), this.carelloRefernz.getSconti()));
        this.carelloRefernz.setIdCliente(dbCart.getIdCliente());

        return true;
    }

    public void clear() {

        this.contenuti.clear();

        if (this.carelloRefernz != null) {
            this.carelloRefernz.setTot(0.0);
            this.carelloRefernz.setSpeseSped(0);
            this.carelloRefernz.setSconti(0);
        }
    }
}
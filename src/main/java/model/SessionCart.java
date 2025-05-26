package model;

import model.Bean.CarrelloBean;
import model.Bean.ContenutoBean;
import model.Bean.ProdottoBean;
import model.Bean.VolumeBean;
import model.DAO.CarrelloDAO;
import model.DAO.ContenutoDAO;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class SessionCart{
    private Collection<ContenutoBean> contenuti;
    private CarrelloBean carelloRefernz;

    public SessionCart() {
        this.contenuti = new ArrayList<ContenutoBean>();
    }

    public void addPrd (ContenutoBean prod){
        if(prod != null){
            this.contenuti.add(prod);
        }
    }

    public int removeProd(int idCont){
       if(contenuti.removeIf(cont -> cont.getIdContenuto() == idCont))
           return 1;
       return 0;
    }

    public ContenutoBean getProd(int idCont){
        if(idCont >= 0)
            return (ContenutoBean) this.contenuti.stream().filter(cont -> cont.getIdContenuto() == idCont);
        return null;
    }

    public Collection<ContenutoBean> getProdotti() {
        return contenuti;
    }

    public Collection<ContenutoBean> getProdottiByLimit(int limit, int offset) {
        if(limit > 0 && offset >= 0) {
            Collection<ContenutoBean> cont = (Collection<ContenutoBean>) this.contenuti.stream().skip((offset - 1) * limit).limit(limit);
            return cont;
        }
        return null;
    }

    public CarrelloBean getCarelloRefernz() {
        return carelloRefernz;
    }

    public void setCarelloRefernz(CarrelloBean carelloRefernz) {
        if(carelloRefernz != null)
            this.carelloRefernz = carelloRefernz;
    }

    public void setContenuti(Collection<ContenutoBean> contenuti) {
        if(contenuti != null)
            this.contenuti = contenuti;
    }

    public void push(DataSource ds){
        try {
            CarrelloDAO cartSQL = new CarrelloDAO(ds);
            ContenutoDAO contSQL = new ContenutoDAO(ds);

            cartSQL.doDelete(this.carelloRefernz.getIdCarello());
            int idCart = cartSQL.doSave(this.carelloRefernz);

            for(ContenutoBean contenuto : this.contenuti){
                contenuto.setIdCarrello(idCart);
                contSQL.doSave(contenuto);
            }

        } catch (SQLException e){
            System.out.println("Error " + e.getMessage());
        }
    }
}

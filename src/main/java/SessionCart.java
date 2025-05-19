import model.Bean.CarrelloBean;
import model.Bean.ProdottoBean;

import java.util.ArrayList;
import java.util.Collection;

public class SessionCart{
    private Collection<ProdottoBean> prodotti;
    private CarrelloBean carelloRefernz;

    public SessionCart() {
        this.prodotti = new ArrayList<ProdottoBean>();
    }

    public void addPrd (ProdottoBean prod){
        if(prod != null){
            this.prodotti.add(prod);
        }
    }

    public int removeProd(int idProd){
       if(prodotti.removeIf(prod -> prod.getIdProdotto() == idProd))
           return 1;
       return 0;
    }

    public ProdottoBean getProd(int idProd){
        if(idProd >= 0)
            return (ProdottoBean) this.prodotti.stream().filter(prod -> prod.getIdProdotto() == idProd);
        return null;
    }

    public Collection<ProdottoBean> getProdotti() {
        return prodotti;
    }

    public Collection<ProdottoBean> getProdottiByLimit(int limit, int offset) {
        if(limit > 0 && offset >= 0) {
            Collection<ProdottoBean> prod = (Collection<ProdottoBean>) this.prodotti.stream().skip((offset - 1) * limit).limit(limit);
            return prod;
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
}

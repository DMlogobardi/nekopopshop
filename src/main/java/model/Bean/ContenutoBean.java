package model.Bean;

import java.io.Serializable;

public class ContenutoBean implements Serializable {
    private int idContenuto;
    private int idCarrello;
    private int idProdotto;

    public ContenutoBean(int idContenuto, int idCarrello, int idProdotto) {
        this.idContenuto = idContenuto;
        this.idCarrello = idCarrello;
        this.idProdotto = idProdotto;
    }

    public int getIdContenuto() {
        return idContenuto;
    }

    public int getIdCarrello() {
        return idCarrello;
    }

    public void setIdCarrello(int idCarrello) {
        if(idCarrello >= 0)
            this.idCarrello = idCarrello;
    }

    public int getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(int idProdotto) {
        if(idProdotto >= 0)
            this.idProdotto = idProdotto;
    }
}

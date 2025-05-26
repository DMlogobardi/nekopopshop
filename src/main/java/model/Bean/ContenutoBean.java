package model.Bean;

import java.io.Serializable;

public class ContenutoBean implements Serializable {
    private int idContenuto;
    private int qCarrello;
    private int idCarrello;
    private int idProdotto;
    private int idVolume;

    public ContenutoBean(int idContenuto, int qCarrello, int idCarrello, int idProdotto, int idVolume) {
        this.idContenuto = idContenuto;
        this.idCarrello = idCarrello;
        this.idProdotto = idProdotto;
        this.idVolume = idVolume;
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

    public int getqCarrello() {
        return qCarrello;
    }

    public void setqCarrello(int qCarrello) {
        if(qCarrello > 0)
            this.qCarrello = qCarrello;
    }

    public int getIdVolume() {
        return idVolume;
    }

    public void setIdVolume(int idVolume) {
        this.idVolume = idVolume;
    }
}

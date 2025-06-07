package model.Bean;

import java.io.Serializable;

public class ContenutoBean implements Serializable {
    private int idContenuto;
    private int qCarrello;
    private int idCarrello;
    private Integer idProdotto;
    private Integer idVolume;

    public ContenutoBean(int idContenuto, int qCarrello, int idCarrello, Integer idProdotto, Integer idVolume) {
        this.idContenuto = idContenuto;
        this.qCarrello = qCarrello;
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

    public Integer getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(Integer idProdotto) {
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

    public Integer getIdVolume() {
        return idVolume;
    }

    public void setIdVolume(Integer idVolume) {
        this.idVolume = idVolume;
    }

    public AcquistatoBean convertirAcquistato(int idOrder) {
        if(idOrder > 0){
            AcquistatoBean temp = new AcquistatoBean(0, qCarrello, idCarrello, idProdotto, idVolume);
            return temp;
        }
        return null;
    }
}

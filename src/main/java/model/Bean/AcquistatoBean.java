package model.Bean;

import java.io.Serializable;

public class AcquistatoBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private int idAcquistato;
    private int idOrdine;
    private int idProdotto;

    public AcquistatoBean(int idAcquistato, int idOrdine, int idProdotto) {
        this.idAcquistato = idAcquistato;
        this.idOrdine = idOrdine;
        this.idProdotto = idProdotto;
    }
    public int getIdAcquistato() {
        return idAcquistato;
    }

    public int getIdOrdine() {
        return idOrdine;
    }

    public int getIdProdotto() {
        return idProdotto;
    }

    public void setIdOrdine(int idOrdine) {
        if(idOrdine > 0) {
            this.idOrdine = idOrdine;
        }
    }

    public void setIdProdotto(int idProdotto) {
        if(idProdotto > 0) {
            this.idProdotto = idProdotto;
        }
    }
}

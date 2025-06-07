package model.Bean;

import java.io.Serializable;

public class AcquistatoBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private int idAcquistato;
    private int qAcquistato;
    private int idOrdine;
    private Integer idProdotto;
    private Integer idVolume;

    public AcquistatoBean(int idAcquistato, int qAcquistato ,int idOrdine, Integer idProdotto, Integer idVolume) {
        this.idAcquistato = idAcquistato;
        this.qAcquistato = qAcquistato;
        this.idOrdine = idOrdine;
        this.idProdotto = idProdotto;
        this.idVolume = idVolume;
    }

    public int getqAcquistato() {
        return qAcquistato;
    }

    public void setqAcquistato(int qAcquistato) {
        this.qAcquistato = qAcquistato;
    }

    public void setIdOrdine(int idOrdine) {
        this.idOrdine = idOrdine;
    }

    public void setIdProdotto(Integer idProdotto) {
        this.idProdotto = idProdotto;
    }

    public Integer getIdVolume() {
        return idVolume;
    }

    public void setIdVolume(Integer idVolume) {
        this.idVolume = idVolume;
    }

    public int getIdAcquistato() {
        return idAcquistato;
    }

    public int getIdOrdine() {
        return idOrdine;
    }

    public Integer getIdProdotto() {
        return idProdotto;
    }

    public void setIdOrdine(Integer idOrdine) {
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

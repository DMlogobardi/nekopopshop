package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class ContenutoDTO implements java.io.Serializable {
    private static final long serialVersionUID = 1L;

    private int idContenuto;
    private int qCarrello;
    private int idCarrello;
    private Integer idProdotto;
    private int idVolume;

    @JsonCreator
    public ContenutoDTO(@JsonProperty("idContenuto") int idContenuto, @JsonProperty("qCarrello") int qCarrello, @JsonProperty("idCarrello") int idCarrello, @JsonProperty("idProdotto") Integer idProdotto, @JsonProperty("idVolume") int idVolume) {
        this.idContenuto = idContenuto;
        this.qCarrello = qCarrello;
        this.idCarrello = idCarrello;
        this.idProdotto = idProdotto;
        this.idVolume = idVolume;
    }

    public int getIdContenuto() {
        return idContenuto;
    }

    public void setIdContenuto(int idContenuto) {
        this.idContenuto = idContenuto;
    }

    public int getqCarrello() {
        return qCarrello;
    }

    public void setqCarrello(int qCarrello) {
        this.qCarrello = qCarrello;
    }

    public int getIdCarrello() {
        return idCarrello;
    }

    public void setIdCarrello(int idCarrello) {
        this.idCarrello = idCarrello;
    }

    public Integer getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(int idProdotto) {
        this.idProdotto = idProdotto;
    }

    public int getIdVolume() {
        return idVolume;
    }

    public void setIdVolume(int idVolume) {
        this.idVolume = idVolume;
    }
}

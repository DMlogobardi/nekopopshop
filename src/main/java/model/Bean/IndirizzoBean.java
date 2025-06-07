package model.Bean;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class IndirizzoBean implements Serializable {
    private int idIndirizzo;
    private String via;
    private int nCivico;
    private String cap;
    private int idCliente;

    @JsonCreator
    public IndirizzoBean(@JsonProperty("idIndirizzo") int idIndirizzo, @JsonProperty("via") String via, @JsonProperty("nCivico") int nCivico, @JsonProperty("cap") String cap, @JsonProperty("idCliente") int idCliente) {
        this.idIndirizzo = idIndirizzo;
        this.via = via;
        this.nCivico = nCivico;
        this.cap = cap;
        this.idCliente = idCliente;
    }

    public void setIdCliente(int idCliente) {
        if(idCliente > 0)
            this.idCliente = idCliente;
    }

    public int getIdIndirizzo() {
        return idIndirizzo;
    }

    public String getVia() {
        return via;
    }

    public void setVia(String via) {
        if(via != null && !via.isBlank())
            this.via = via;
    }

    public int getnCivico() {
        return nCivico;
    }

    public void setnCivico(int nCivico) {
        if(nCivico > 0)
            this.nCivico = nCivico;
    }

    public String getCap() {
        return cap;
    }

    public void setCap(String cap) {
        if(cap != null && !cap.isBlank())
            this.cap = cap;
    }

    public int getIdCliente() {
        return idCliente;
    }
}

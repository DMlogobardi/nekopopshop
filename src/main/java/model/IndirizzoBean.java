package model;

import java.io.Serializable;

public class IndirizzoBean implements Serializable {
    private int idIndirizzo;
    private String via;
    private int nCivico;
    private String cap;
    private int idCliente;

    public IndirizzoBean(int idIndirizzo, String via, int nCivico, String cap, int idCliente) {
        this.idIndirizzo = idIndirizzo;
        this.via = via;
        this.nCivico = nCivico;
        this.cap = cap;
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

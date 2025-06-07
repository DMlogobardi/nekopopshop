package model.Bean;

import java.io.Serializable;

public class CarrelloBean implements Serializable {
    private int idCarello;
    private Double tot;
    private double speseSped;
    private int sconti;
    private int idCliente;

    public CarrelloBean() {
        this.idCarello = 0;
        this.tot = 0.0;
        this.speseSped = 2.0;
        this.sconti = 0;
        this.idCliente = 0;
    }

    public CarrelloBean(int idCarello, Double tot, double speseSped, int sconti, int idCliente) {
        this.idCarello = idCarello;
        this.tot = tot;
        this.speseSped = speseSped;
        this.sconti = sconti;
        this.idCliente = idCliente;
    }

    public void setIdCarello(int idCarello) {
        this.idCarello = idCarello;
    }

    public int getIdCarello() {
        return idCarello;
    }

    public Double getTot() {
        return tot;
    }

    public double getSpeseSped() {
        return speseSped;
    }

    public int getSconti() {
        return sconti;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setTot(double tot) {
        this.tot = tot;
    }

    public void setSpeseSped(double speseSped) {
        if(tot > 0.0)
            this.speseSped = speseSped;
    }

    public void setSconti(int sconti) {
        if(sconti > 0)
            this.sconti = sconti;
    }

    public void setIdCliente(int idCliente) {
        if(idCliente > 0)
            this.idCliente = idCliente;
    }
}

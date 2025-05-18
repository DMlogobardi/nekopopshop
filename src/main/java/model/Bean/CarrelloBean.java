package model.Bean;

import java.io.Serializable;

public class CarrelloBean implements Serializable {
    private int idCarello;
    private double tot;
    private double speseSped;
    private Double sconti;
    private int idCliente;

    public CarrelloBean(int idCarello, double tot, double speseSped, Double sconti, int idCliente) {
        this.idCarello = idCarello;
        this.tot = tot;
        this.speseSped = speseSped;
        this.sconti = sconti;
        this.idCliente = idCliente;
    }

    public int getIdCarello() {
        return idCarello;
    }

    public double getTot() {
        return tot;
    }

    public double getSpeseSped() {
        return speseSped;
    }

    public Double getSconti() {
        return sconti;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setTot(double tot) {
        if(tot > 0.0)
            this.tot = tot;
    }

    public void setSpeseSped(double speseSped) {
        if(tot > 0.0)
            this.speseSped = speseSped;
    }

    public void setSconti(Double sconti) {
        if(sconti > 0.0)
            this.sconti = sconti;
    }
}

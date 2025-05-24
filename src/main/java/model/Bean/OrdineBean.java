package model.Bean;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class OrdineBean implements Serializable {
    private int idOrdine;
    private double tot;
    private String dataOrdine;
    private String dataArrivos;
    private int idCliente;
    private int idMetodoPag;

    public OrdineBean(int idOrdine, double tot,  String dataOrdine, String dataArrivo ,int idCliente, int idMetodoPag) {
        this.idOrdine = idOrdine;
        this.tot = tot;
        this.dataOrdine = dataOrdine;
        this.dataArrivos = dataArrivos;
        this.idCliente = idCliente;
        this.idMetodoPag = idMetodoPag;
    }

    public int getIdOrdine() {
        return idOrdine;
    }

    public double getTot() {
        return tot;
    }

    public void setTot(double tot) {
        if (tot >= 0.0)
            this.tot = tot;
    }

    public String getDataOrdine() {
        return dataOrdine;
    }

    public LocalDate getDataOrdineFormatted() {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-mm-dd");
        LocalDate date =LocalDate.parse(dataOrdine, format);
        return date;
    }

    public void setDataOrdine(String dataOrdine) {
        if(dataOrdine != null && !dataOrdine.isBlank())
            this.dataOrdine = dataOrdine;
    }

    public String getDataArrivo() {
        return dataArrivos;
    }

    public LocalDate getDataArrivoFormatted() {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-mm-dd");
        LocalDate date =LocalDate.parse(dataArrivos, format);
        return date;
    }

    public void setDataArrivos(String dataArrivos) {
        this.dataArrivos = dataArrivos;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public int getIdMetodoPag() {
        return idMetodoPag;
    }
}
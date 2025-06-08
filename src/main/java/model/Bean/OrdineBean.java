package model.Bean;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class OrdineBean implements Serializable {
    private int idOrdine;
    private double tot;
    private String dataOrdine;
    private String dataArrivos;
    private int idCliente;
    private int idIndirizzo;
    private int idMetodoPag;

    public OrdineBean(int idOrdine, double tot,  String dataOrdine, String dataArrivo ,int idCliente, int idIndirizzo, int idMetodoPag) {
        this.idOrdine = idOrdine;
        this.tot = tot;
        this.dataOrdine = dataOrdine;
        this.dataArrivos = dataArrivos;
        this.idCliente = idCliente;
        this.idIndirizzo = idIndirizzo;
        this.idMetodoPag = idMetodoPag;
    }

    public String getDataArrivos() {
        return dataArrivos;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public void setIdMetodoPag(int idMetodoPag) {
        this.idMetodoPag = idMetodoPag;
    }

    public int getIdIndirizzo() {
        return idIndirizzo;
    }

    public void setIdIndirizzo(int idIndirizzo) {
        this.idIndirizzo = idIndirizzo;
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

    @JsonIgnore
    public LocalDate getDataOrdineFormatted() {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
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

    @JsonIgnore
    public LocalDate getDataArrivoFormatted() {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
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

    @JsonIgnore
    public static LocalDate calcolaDataConGiorniLavorativi(int giorniLavorativi) {
        LocalDate data = LocalDate.now();
        int aggiunti = 0;

        while (aggiunti < giorniLavorativi) {
            data = data.plusDays(1);
            if (!(data.getDayOfWeek() == DayOfWeek.SATURDAY || data.getDayOfWeek() == DayOfWeek.SUNDAY)) {
                aggiunti++;
            }
        }
        return data;
    }
}
package model.Bean;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class ReaderBean implements Serializable {
    private int idReader;
    private String dataAcquisto;
    private String dataUltimaApertura;
    private int idVolume;
    private int idCliente;

    public ReaderBean(int idReader, String dataAcquisto, String dataUltimaApertura, int idVolume,int idCliente) {
        this.idReader = idReader;
        this.dataAcquisto = dataAcquisto;
        this.dataUltimaApertura = dataUltimaApertura;
        this.idVolume = idVolume;
        this.idCliente = idCliente;
    }

    public int getIdReader() {
        return idReader;
    }

    public String getDataAcquisto() {
        return dataAcquisto;
    }

    @JsonIgnore
    public Date getDataAcquistoFormatted() {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date =LocalDate.parse(dataAcquisto, format);
        return Date.valueOf(date);
    }

    public void setDataAcquisto(String dataAcquisto) {
        if(dataAcquisto != null && !dataAcquisto.isBlank()) {}
            this.dataAcquisto = dataAcquisto;
    }

    public String getDataUltimaApertura() {
        return dataUltimaApertura;
    }

    @JsonIgnore
    public Date getDataUltimaAperturaFormatted() {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ITALIAN);
        LocalDate date =LocalDate.parse(dataUltimaApertura, format);
        return Date.valueOf(date);
    }
    public void setDataUltimaApertura(String dataUltimaApertura) {
        if(!dataUltimaApertura.isBlank() || dataUltimaApertura == null) {}
            this.dataUltimaApertura = dataUltimaApertura;
    }

    public int getIdVolume() {
        return idVolume;
    }

    public int getIdCliente() {
        return idCliente;
    }
}

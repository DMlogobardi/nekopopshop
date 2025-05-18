package model.Bean;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class ReaderBean implements Serializable {
    private int idReader;
    private String dataAcquisto;
    private String dataUltimaApertura;
    private int idProdotto;
    private int idCliente;

    public ReaderBean(int idReader, String dataAcquisto, String dataUltimaApertura, int idProdotto,int idCliente) {
        this.idReader = idReader;
        this.dataAcquisto = dataAcquisto;
        this.dataUltimaApertura = dataUltimaApertura;
        this.idProdotto = idProdotto;
        this.idCliente = idCliente;
    }

    public int getIdReader() {
        return idReader;
    }

    public String getDataAcquisto() {
        return dataAcquisto;
    }

    public LocalDate getDataAcquistoFormatted() {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-mm-dd");
        LocalDate date =LocalDate.parse(dataAcquisto, format);
        return date;
    }

    public void setDataAcquisto(String dataAcquisto) {
        if(dataAcquisto != null && !dataAcquisto.isBlank()) {}
            this.dataAcquisto = dataAcquisto;
    }

    public String getDataUltimaApertura() {
        return dataUltimaApertura;
    }

    public LocalDate getDataUltimaAperturaFormatted() {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-mm-dd");
        LocalDate date =LocalDate.parse(dataUltimaApertura, format);
        return date;
    }
    public void setDataUltimaApertura(String dataUltimaApertura) {
        if(!dataUltimaApertura.isBlank() || dataUltimaApertura == null) {}
            this.dataUltimaApertura = dataUltimaApertura;
    }

    public int getIdProdotto() {
        return idProdotto;
    }

    public int getIdCliente() {
        return idCliente;
    }
}

package model.Bean;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class VolumeBean implements Serializable {
    private int idVolume;
    private int numVolumi;
    private double prezzo;
    private int quantita;
    private String dataPubl;
    private byte[] imgVol;
    private String tag;
    private int idProdotto;

    public VolumeBean(int idVolume, int numVolumi, double prezzo, int quantita, String dataPubl, byte[] imgVol, String tag, int idProdotto) {
        this.idVolume = idVolume;
        this.numVolumi = numVolumi;
        this.prezzo = prezzo;
        this.quantita = quantita;
        this.dataPubl = dataPubl;
        this.imgVol = imgVol;
        this.tag = tag;
        this.idProdotto = idProdotto;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public int getIdVolume() {
        return idVolume;
    }

    public int getNumVolumi() {
        return numVolumi;
    }

    public void setNumVolumi(int numVolumi) {
        if(numVolumi > 0)
            this.numVolumi = numVolumi;
    }

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        if(prezzo > 0.0)
            this.prezzo = prezzo;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        if(quantita > 0)
            this.quantita = quantita;
    }

    public String getDataPubl() {
        return dataPubl;
    }

    @JsonIgnore
    public Date getDataPublFormatted() {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date =LocalDate.parse(dataPubl, format);
        return Date.valueOf(date);
    }

    public void setDataPubl(String dataPubl) {
        if(dataPubl!=null && dataPubl.isBlank()) {}
            this.dataPubl = dataPubl;
    }

    public byte[] getImgVol() {
        return imgVol;
    }

    public void setImgVol(byte[] imgVol) {
        if(imgVol != null && imgVol.length > 0)
            this.imgVol = imgVol;
    }

    public int getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(int idProdotto) {
        if(idProdotto > 0)
            this.idProdotto = idProdotto;
    }
}

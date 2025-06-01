package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class VolumeDTO implements Serializable {
    private final static long serialVersionUID = 1L;

    private int idImg;
    private int idProd;
    private int numVolume;
    private double prezzo;
    private int quantita;
    private String datapubl;

    @JsonCreator
    public VolumeDTO(@JsonProperty("idImg") int idImg, @JsonProperty("idProd") int idProd, @JsonProperty("numVolume") int numVolume, @JsonProperty("prezzo") double prezzo, @JsonProperty("quantita") int quantita, @JsonProperty("datapubl") String datapubl) {
        this.idImg = idImg;
        this.idProd = idProd;
        this.numVolume = numVolume;
        this.prezzo = prezzo;
        this.quantita = quantita;
        this.datapubl = datapubl;
    }

    public int getIdImg() {
        return idImg;
    }

    public void setIdImg(int idImg) {
        this.idImg = idImg;
    }

    public int getIdProd() {
        return idProd;
    }

    public void setIdProd(int idProd) {
        this.idProd = idProd;
    }

    public int getNumVolume() {
        return numVolume;
    }

    public void setNumVolume(int numVolume) {
        this.numVolume = numVolume;
    }

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    public String getDatapubl() {
        return datapubl;
    }

    public void setDatapubl(String datapubl) {
        this.datapubl = datapubl;
    }
}

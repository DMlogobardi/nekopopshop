package model;

import java.io.Serializable;

public class VolumeBean implements Serializable {
    private int idVolume;
    private int numVolumi;
    private double prezzo;
    private int quantita;
    private String dataPubl;
    private byte[] imgVol;
    private int idProdotto;

    public VolumeBean(int idVolume, int numVolumi, double prezzo, int quantita, String dataPubl, byte[] imgVol, int idProdotto) {
        this.idVolume = idVolume;
        this.numVolumi = numVolumi;
        this.prezzo = prezzo;
        this.quantita = quantita;
        this.dataPubl = dataPubl;
        this.imgVol = imgVol;
        this.idProdotto = idProdotto;
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
}

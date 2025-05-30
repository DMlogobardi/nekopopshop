package model.Bean;

import java.io.Serializable;

public class ProdottoBean implements Serializable {
    private int idProdotto;
    private String nome;
    private Integer quantita;
    private Double prezzo;
    private String autore;
    private byte[] imgProd;
    private String descrizione;

    public ProdottoBean(int idProdotto, String nome, Integer quantita, Double prezzo, String autore, byte[] imgProd, String descrizione) {
        this.idProdotto = idProdotto;
        this.nome = nome;
        this.quantita = quantita;
        this.prezzo = prezzo;
        this.autore = autore;
        this.imgProd = imgProd;
        this.descrizione = descrizione;
    }

    public int getIdProdotto() {
        return idProdotto;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        if(nome != null && !nome.isBlank())
            this.nome = nome;
    }

    public Integer getQuantita() {
        return quantita;
    }

    public void setQuantita(Integer quantita) {
        if(quantita >= 0)
            this.quantita = quantita;
    }

    public Double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(Double prezzo) {
        if(prezzo >= 0.0)
            this.prezzo = prezzo;
    }

    public String getAutore() {
        return autore;
    }

    public void setAutore(String autore) {
        if(!autore.isBlank() || autore == null)
            this.autore = autore;
    }

    public byte[] getImgProd() {
        return imgProd;
    }

    public void setImgProd(byte[] imgProd) {
        if(imgProd.length > 0)
            this.imgProd = imgProd;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        if(descrizione != null && !descrizione.isBlank())
            this.descrizione = descrizione;
    }
}

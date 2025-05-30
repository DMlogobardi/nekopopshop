package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class ProdottoDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private int idImg;
    private int idTempVolume;
    private String nome;
    private Integer quantita;
    private Double prezzo;
    private String autor;
    private String descrizzione;

    @JsonCreator
    public ProdottoDTO(@JsonProperty("idImg") int idImg,  @JsonProperty("idVolume") int idTempVolume, @JsonProperty("nome") String nome, @JsonProperty("quantita") Integer quantita, @JsonProperty("prezzo") Double prezzo, @JsonProperty("autore") String autor, @JsonProperty("descrizzione") String descrizzione) {
        this.idImg = idImg;
        this.idTempVolume = idTempVolume;
        this.nome = nome;
        this.quantita = quantita;
        this.prezzo = prezzo;
        this.autor = autor;
        this.descrizzione = descrizzione;
    }

    public int getIdImg() {
        return idImg;
    }

    public void setIdImg(int idImg) {
        this.idImg = idImg;
    }

    public int getIdTempVolume() {
        return idTempVolume;
    }

    public void setIdTempVolume(int idTempVolume) {
        this.idTempVolume = idTempVolume;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    public Double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getDescrizzione() {
        return descrizzione;
    }

    public void setDescrizzione(String descrizzione) {
        this.descrizzione = descrizzione;
    }
}

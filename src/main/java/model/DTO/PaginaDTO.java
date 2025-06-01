package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class PaginaDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private int numPag;
    private int idTavola;
    private String dataCaricamento;
    private int idCapitolo;

    @JsonCreator

    public PaginaDTO(@JsonProperty("numPag") int numPag, @JsonProperty("idTavola") int idTavola, @JsonProperty("dataCaricamento") String dataCaricamento, @JsonProperty("idCapitolo") int idCapitolo) {
        this.numPag = numPag;
        this.idTavola = idTavola;
        this.dataCaricamento = dataCaricamento;
        this.idCapitolo = idCapitolo;
    }

    public int getNumPag() {
        return numPag;
    }

    public void setNumPag(int numPag) {
        this.numPag = numPag;
    }

    public int getIdTavola() {
        return idTavola;
    }

    public void setIdTavola(int idTavola) {
        this.idTavola = idTavola;
    }

    public String getDataCaricamento() {
        return dataCaricamento;
    }

    public void setDataCaricamento(String dataCaricamento) {
        this.dataCaricamento = dataCaricamento;
    }

    public int getIdCapitolo() {
        return idCapitolo;
    }

    public void setIdCapitolo(int idCapitolo) {
        this.idCapitolo = idCapitolo;
    }
}

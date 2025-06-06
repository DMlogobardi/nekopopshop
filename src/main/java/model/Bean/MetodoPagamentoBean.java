package model.Bean;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class MetodoPagamentoBean implements Serializable {
    private int idMetodoPagamento;
    private String nCarta;
    private String tipo;
    private String dataScadenza;
    private String nomeInte;
    private String cognomeInt;
    private int idCliente;

    @JsonCreator
    public MetodoPagamentoBean(@JsonProperty("idMetodoPagamento") int idMetodoPagamento, @JsonProperty("nCarta") String nCarta, @JsonProperty("tipo") String tipo, @JsonProperty("dataScadenza") String dataScadenza, @JsonProperty("nomeInte") String nomeInte, @JsonProperty("cognomeInt") String cognomeInt, @JsonProperty("idCliente") int idCliente) {
        this.idMetodoPagamento = idMetodoPagamento;
        this.nCarta = nCarta;
        this.tipo = tipo;
        this.dataScadenza = dataScadenza;
        this.nomeInte = nomeInte;
        this.cognomeInt = cognomeInt;
        this.idCliente = idCliente;
    }

    public void setIdCliente(int idCliente) {
        if(idCliente > 0)
            this.idCliente = idCliente;
    }

    public int getIdMetodoPagamento() {
        return idMetodoPagamento;
    }

    public String getnCarta() {
        return nCarta;
    }

    public void setnCarta(String nCarta) {
        if(nCarta != null && !nCarta.isBlank() && nCarta.length() == 4)
            this.nCarta = nCarta;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        if(tipo != null && !tipo.isBlank())
            this.tipo = tipo;
    }

    public String getDataScadenza() {
        return dataScadenza;
    }

    @JsonIgnore
    public LocalDate getDataScadenzaFormatted() {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date =LocalDate.parse(dataScadenza, format);
        return date;
    }

    public void setDataScadenza(String dataScadenza) {
        if(dataScadenza != null && !dataScadenza.isBlank())
            this.dataScadenza = dataScadenza;
    }

    public String getNomeInte() {
        return nomeInte;
    }

    public void setNomeInte(String nomeInte) {
        if(nomeInte != null && !nomeInte.isBlank())
            this.nomeInte = nomeInte;
    }

    public String getCognomeInt() {
        return cognomeInt;
    }

    public void setCognomeInt(String cognomeInt) {
        if(cognomeInt != null && !cognomeInt.isBlank())
            this.cognomeInt = cognomeInt;
    }

    public int getIdCliente() {
        return idCliente;
    }
}



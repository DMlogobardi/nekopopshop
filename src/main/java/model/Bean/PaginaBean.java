package model.Bean;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class PaginaBean implements Serializable {
    private int idPagina;
    private int numPag;
    private byte[] tavola;
    private String dataCaricamento;
    private int idCapitolo;

    public PaginaBean(int idPagina, int numPag, byte[] tavola, String dataCaricamento, int idCapitolo) {
        this.idPagina = idPagina;
        this.numPag = numPag;
        this.tavola = tavola;
        this.dataCaricamento = dataCaricamento;
        this.idCapitolo = idCapitolo;
    }

    public int getIdPagina() {
        return idPagina;
    }

    public int getNumPag() {
        return numPag;
    }

    public void setNumPag(int numPag) {
        if(numPag > 0)
            this.numPag = numPag;
    }

    public byte[] getTavola() {
        return tavola;
    }

    public void setTavola(byte[] tavola) {
        if (tavola != null && tavola.length > 0)
            this.tavola = tavola;
    }

    public String getDataCaricamento() {
        return dataCaricamento;
    }

    public LocalDate getDataCaricamentoFormatted() {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-mm-dd");
        LocalDate date =LocalDate.parse(dataCaricamento, format);
        return date;
    }

    public void setDataCaricamento(String dataCaricamento) {
        if(dataCaricamento != null && !dataCaricamento.isBlank())
            this.dataCaricamento = dataCaricamento;
    }

    public int getIdCapitolo() {
        return idCapitolo;
    }
}

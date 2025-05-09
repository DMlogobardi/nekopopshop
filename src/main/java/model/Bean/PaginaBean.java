package model.Bean;

import java.io.Serializable;

public class PaginaBean implements Serializable {
    private int idPagina;
    private int numPag;
    private Byte[] tavola;
    private String dataCaricamento;
    private int idCapitolo;

    public PaginaBean(int idPagina, int numPag, Byte[] tavola, String dataCaricamento, int idCapitolo) {
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

    public Byte[] getTavola() {
        return tavola;
    }

    public void setTavola(Byte[] tavola) {
        if (tavola != null && tavola.length > 0)
            this.tavola = tavola;
    }

    public String getDataCaricamento() {
        return dataCaricamento;
    }

    public void setDataCaricamento(String dataCaricamento) {
        if(dataCaricamento != null && !dataCaricamento.isBlank())
            this.dataCaricamento = dataCaricamento;
    }

    public int getIdCapitolo() {
        return idCapitolo;
    }
}

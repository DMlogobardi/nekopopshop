package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;
import java.util.Collection;

public class ReaderDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;
    private int numCapitolo;
    private String dataPub;
    private int idVolume;
    private Collection<PaginaDTO> pagine;

    @JsonCreator
    public ReaderDTO(@JsonProperty("idCapitolo") Integer id, @JsonProperty("numCapitolo") int numCapitolo, @JsonProperty("dataPub") String dataPub, @JsonProperty("idVolume") int idVolume, @JsonProperty("pagine") Collection<PaginaDTO> pagine) {
        this.id = id;
        this.numCapitolo = numCapitolo;
        this.dataPub = dataPub;
        this.idVolume = idVolume;
        this.pagine = pagine;
    }

    @JsonIgnore
    public ReaderDTO() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getNumCapitolo() {
        return numCapitolo;
    }

    public void setNumCapitolo(int numCapitolo) {
        this.numCapitolo = numCapitolo;
    }

    public String getDataPub() {
        return dataPub;
    }

    public void setDataPub(String dataPub) {
        this.dataPub = dataPub;
    }

    public int getIdVolume() {
        return idVolume;
    }

    public void setIdVolume(int idVolume) {
        this.idVolume = idVolume;
    }

    public Collection<PaginaDTO> getPagine() {
        return pagine;
    }

    public void setPagine(Collection<PaginaDTO> pagine) {
        this.pagine = pagine;
    }
}
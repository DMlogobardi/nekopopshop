package model.Bean;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class CapitoloBean implements Serializable {
    private int idCapitolo;
    private float numCapitolo;
    private String dataPub;
    private int idVolume;

    public CapitoloBean(int idCapitolo, float numCapitolo, String dataPub, int idVolume) {
        this.idCapitolo = idCapitolo;
        this.numCapitolo = numCapitolo;
        this.dataPub = dataPub;
        this.idVolume = idVolume;
    }

    public int getIdCapitolo() {
        return idCapitolo;
    }

    public float getNumCapitolo() {
        return numCapitolo;
    }

    public String getDataPub() {
        return dataPub;
    }

    @JsonIgnore
    public Date getDataPubFormatted() {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-mm-dd");
        LocalDate date =LocalDate.parse(dataPub, format);
        return Date.valueOf(date);
    }

    public int getIdVolume() {
        return idVolume;
    }

    public void setNumCapitolo(float numCapitolo) {
        if (numCapitolo > 0)
            this.numCapitolo = numCapitolo;
    }

    public void setDataPub(String dataPub) {
        if (dataPub != null && !dataPub.isBlank()) {
            this.dataPub = dataPub;
        }
    }
}

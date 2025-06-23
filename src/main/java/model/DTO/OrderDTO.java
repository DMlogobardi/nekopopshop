package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import model.Bean.IndirizzoBean;
import model.Bean.MetodoPagamentoBean;

import java.io.Serializable;

public class OrderDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private int card;
    private int indirizzo;

    @JsonCreator
    public OrderDTO(@JsonProperty("card") int card, @JsonProperty("indirizzo") int indirizzo) {
        this.card = card;
        this.indirizzo = indirizzo;
    }

    public int getCard() {
        return card;
    }

    public void setCard(int card) {
        this.card = card;
    }

    public int getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(int indirizzo) {
        this.indirizzo = indirizzo;
    }
}

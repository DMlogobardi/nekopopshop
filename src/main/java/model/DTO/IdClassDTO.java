package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class IdClassDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private String tipo;
    private Integer id;

    @JsonCreator
    public IdClassDTO(@JsonProperty("tipo") String tipo, @JsonProperty("id") Integer id) {
        this.tipo = tipo;
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getId() {
        return id;
    }

    public void setId(Integer  id) {
        this.id = id;
    }
}
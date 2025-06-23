package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class ClienteDTO implements java.io.Serializable{
    private static final long serialVersionUID = 1L;

    private String nome;
    private String cognome;
    private String dataNascita;
    private String email;
    private String cF;

    @JsonCreator
    public ClienteDTO(@JsonProperty("nome") String nome, @JsonProperty("cognome") String cognome, @JsonProperty("dataNascita") String dataNascita, @JsonProperty("email") String email, @JsonProperty("cF") String cF) {

        this.nome = nome;
        this.cognome = cognome;
        this.dataNascita = dataNascita;
        this.email = email;
        this.cF = cF;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getDataNascita() {
        return dataNascita;
    }

    public void setDataNascita(String dataNascita) {
        this.dataNascita = dataNascita;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getcF() {
        return cF;
    }

    public void setcF(String cF) {
        this.cF = cF;
    }
}

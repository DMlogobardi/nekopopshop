package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonEnumDefaultValue;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class RegisterDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private String name;
    private String cognome;
    private String nascita;
    private String email;
    private String cf;
    private String via;
    private int civico;
    private String cap;
    private String prefisso;
    private String numero;
    private String password;
    private String nick;

    @JsonCreator
    public RegisterDTO(@JsonProperty("name") String name, @JsonProperty("cognome") String cognome, @JsonProperty("nascita") String nascita, @JsonProperty("email") String email, @JsonProperty("cf") String cf, @JsonProperty("via") String via, @JsonProperty("civico") int civico, @JsonProperty("cap") String cap, @JsonProperty("prefisso") String prefisso, @JsonProperty("numero") String numero, @JsonProperty("password") String password, @JsonProperty("nick") String nick) {
        this.name = name;
        this.cognome = cognome;
        this.nascita = nascita;
        this.email = email;
        this.cf = cf;
        this.via = via;
        this.civico = civico;
        this.cap = cap;
        this.prefisso = prefisso;
        this.numero = numero;
        this.password = password;
        this.nick = nick;
    }

    public String getNascita() {
        return nascita;
    }

    public void setNascita(String nascita) {
        this.nascita = nascita;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCf() {
        return cf;
    }

    public void setCf(String cf) {
        this.cf = cf;
    }

    public String getVia() {
        return via;
    }

    public void setVia(String via) {
        this.via = via;
    }

    public int getCivico() {
        return civico;
    }

    public void setCivico(int civico) {
        this.civico = civico;
    }

    public String getCap() {
        return cap;
    }

    public void setCap(String cap) {
        this.cap = cap;
    }

    public String getPrefisso() {
        return prefisso;
    }

    public void setPrefisso(String prefisso) {
        this.prefisso = prefisso;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }
}

package model.Bean;

import java.io.Serializable;

public class NumTelefonoBean implements Serializable {
    private int idTelefono;
    private String prefisso;
    private String numero;
    private String idCliente;

    public NumTelefonoBean(int idTelefono, String prefisso, String numero, String idCliente) {
        this.idTelefono = idTelefono;
        this.prefisso = prefisso;
        this.numero = numero;
        this.idCliente = idCliente;
    }

    public int getIdTelefono() {
        return idTelefono;
    }

    public String getPrefisso() {
        return prefisso;
    }

    public void setPrefisso(String prefisso) {
        if(prefisso != null && !prefisso.isBlank())
            this.prefisso = prefisso;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        if(numero != null && !numero.isBlank() && numero.length() == 10)
            this.numero = numero;
    }

    public String getIdCliente() {
        return idCliente;
    }
}

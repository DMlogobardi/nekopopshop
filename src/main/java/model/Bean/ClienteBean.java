package model.Bean;

import java.io.Serializable;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ClienteBean implements Serializable {
    private int idCliente;
    private String nome;
    private String cognome;
    private String dataNascita;
    private String email;
    private String cF;

    public ClienteBean(int idCliente, String nome, String cognome, String dataNascita, String email, String cF) {
        this.idCliente = idCliente;
        this.nome = nome;
        this.cognome = cognome;
        this.dataNascita = dataNascita;
        this.email = email;
        this.cF = cF;
    }

    public static ClienteBean getByCheckEmail(int idCliente, String nome, String cognome, String dataNascita, String email, String cF) {
        ClienteBean cliente = null;
        if(mailSyntaxCheck(email)) {
            cliente = new ClienteBean(idCliente, nome, cognome, dataNascita, email, cF);
        }
        return cliente;
    }

    private static boolean mailSyntaxCheck(String email)
    {
        // Create the Pattern using the regex
        Pattern p = Pattern.compile(".+@.+\\.[a-z]+");

        // Match the given string with the pattern
        Matcher m = p.matcher(email);

        // check whether match is found
        boolean matchFound = m.matches();

        StringTokenizer st = new StringTokenizer(email, ".");
        String lastToken = null;
        while (st.hasMoreTokens()) {
            lastToken = st.nextToken();
        }

        // validate the country code
        if (matchFound && lastToken.length() >= 2
                && email.length() - 1 != lastToken.length()) {

            return true;
        } else {
            return false;
        }

    }

    public int getIdCliente() {
        return idCliente;
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
        if(cF != null && !cF.isBlank())
            this.dataNascita = dataNascita;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        if(email != null && !email.isBlank() && mailSyntaxCheck(email))
            this.email = email;
    }

    public String getcF() {
        return cF;
    }

    public void setcF(String cF) {
        if(cF != null && !cF.isBlank() && cF.length() == 16)
            this.cF = cF;
    }
}

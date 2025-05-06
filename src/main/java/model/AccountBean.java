package model;

import java.io.Serializable;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

public class AccountBean implements Serializable {

    private static final long serialVersionUID = 1L;

    int idAccount;
    String password;
    String nickName;
    boolean adminFlag;
    int idCliente;

    public AccountBean(int idAccount, String password, String nickName, int idCliente) {
        this.idAccount = idAccount;
        this.password = hashPassword(password);
        this.nickName = nickName;
        this.adminFlag = false;
        this.idCliente = idCliente;
    }
    private String hashPassword(String password) {
        String hashedPassword = "";
        try{
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            byte[] hash = md.digest(password.getBytes(StandardCharsets.UTF_8));
            for (int i = 0; i < hash.length; i++) {
                hashedPassword += Integer.toHexString((hash[i] & 0xff) | 0x100).substring(1,3);
            }
        }catch (java.security.NoSuchAlgorithmException e) {
            System.out.println(e);
        }
        return hashedPassword;
    }

    public int getIdAccount() {
        return idAccount;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        if(password != null && !password.isEmpty()) {
            this.password = hashPassword(password);
        }
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        if(nickName != null && !nickName.isEmpty()) {
            this.nickName = nickName;
        }
    }

    public int getIdCliente() {
        return idCliente;
    }

    public boolean isAdminFlag() {
        return adminFlag;
    }

    public void setAdmin() {
        this.adminFlag = true;
    }
}

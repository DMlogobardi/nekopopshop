package model.Bean;

import java.io.Serializable;

public class WishlistBean implements Serializable {
    private int idWishlist;
    private int idProdotto;
    private int idCliente;
    private int idVolume;

    public WishlistBean(int idWishlist, int idProdotto, int idCliente, int idVolume) {
        this.idWishlist = idWishlist;
        this.idProdotto = idProdotto;
        this.idCliente = idCliente;
        this.idVolume = idVolume;
    }

    public void setIdWishlist(int idWishlist) {
        this.idWishlist = idWishlist;
    }

    public void setIdProdotto(int idProdotto) {
        this.idProdotto = idProdotto;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdVolume() {
        return idVolume;
    }

    public void setIdVolume(int idVolume) {
        this.idVolume = idVolume;
    }

    public int getIdWishlist() {
        return idWishlist;
    }

    public int getIdProdotto() {
        return idProdotto;
    }

    public int getIdCliente() {
        return idCliente;
    }
}

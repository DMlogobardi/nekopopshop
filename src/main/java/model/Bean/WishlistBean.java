package model.Bean;

import java.io.Serializable;

public class WishlistBean implements Serializable {
    private int idWishlist;
    private int idProdotto;
    private int idCliente;

    public WishlistBean(int idWishlist, int idProdotto, int idCliente) {
        this.idWishlist = idWishlist;
        this.idProdotto = idProdotto;
        this.idCliente = idCliente;
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

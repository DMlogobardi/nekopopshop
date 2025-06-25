package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class WishListDTO implements java.io.Serializable {
    static final long serialVersionUID = 1L;

    private int idWishList;
    private Integer idProdotto;
    private int idCliente;
    private Integer idVolume;

    @JsonCreator
    public WishListDTO(@JsonProperty("idWishList") int idWishList, @JsonProperty("idProdotto") Integer idProdotto, @JsonProperty("idCliente") int idCliente, @JsonProperty("idVolume") Integer idVolume) {
        this.idWishList = idWishList;
        this.idProdotto = idProdotto;
        this.idCliente = idCliente;
        this.idVolume = idVolume;
    }

    public int getIdWishList() {
        return idWishList;
    }

    public void setIdWishList(int idWishList) {
        this.idWishList = idWishList;
    }

    public Integer getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(Integer idProdotto) {
        this.idProdotto = idProdotto;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public Integer getIdVolume() {
        return idVolume;
    }

    public void setIdVolume(Integer idVolume) {
        this.idVolume = idVolume;
    }
}

package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import model.Bean.ProdottoBean;
import model.Bean.VolumeBean;
import model.DAO.VolumeDAO;

import java.util.ArrayList;
import java.util.Collection;

public class BookDTO implements java.io.Serializable {
    private static final long serialVersionUID = 1L;

    private ProdottoBean prodottoDTO;
    private Collection<VolumeBean> volumi;

    @JsonCreator
    public BookDTO(@JsonProperty("prodotto") ProdottoBean prodottoDTO, @JsonProperty("volumi") Collection<VolumeBean> volumi) {
        this.prodottoDTO = prodottoDTO;
        this.volumi = volumi;
    }

    @JsonIgnore
    public BookDTO() {
        this.prodottoDTO = null;
        this.volumi = new ArrayList<VolumeBean>();
    }

    public ProdottoBean getProdottoDTO() {
        return prodottoDTO;
    }

    public void setProdottoDTO(ProdottoBean prodottoDTO) {
        this.prodottoDTO = prodottoDTO;
    }

    public Collection<VolumeBean> getVolumi() {
        return volumi;
    }

    public void setVolumi(Collection<VolumeBean> volumi) {
        this.volumi = volumi;
    }
}

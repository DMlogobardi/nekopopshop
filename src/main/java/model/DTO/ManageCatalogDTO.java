package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;
import java.util.Collection;

public class ManageCatalogDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private Collection<ProdottoDTO> prodotti;
    private Collection<VolumeDTO> volumi;

    @JsonCreator
    public ManageCatalogDTO(@JsonProperty("prodotti") Collection<ProdottoDTO> prodotti, @JsonProperty("volumi") Collection<VolumeDTO> volumi) {
        this.prodotti = prodotti;
        this.volumi = volumi;
    }

    public Collection<ProdottoDTO> getProdotti() {
        return prodotti;
    }

    public void setProdotti(Collection<ProdottoDTO> prodotti) {
        this.prodotti = prodotti;
    }

    public Collection<VolumeDTO> getVolumi() {
        return volumi;
    }

    public void setVolumi(Collection<VolumeDTO> volumi) {
        this.volumi = volumi;
    }
}

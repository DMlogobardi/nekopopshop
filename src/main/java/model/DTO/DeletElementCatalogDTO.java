package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;
import java.util.Collection;

public class DeletElementCatalogDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private Collection<IdClassDTO> elements;

    @JsonCreator
    public DeletElementCatalogDTO(@JsonProperty("element") Collection<IdClassDTO> elements) {
        this.elements = elements;
    }

    public Collection<IdClassDTO> getIds() {
        return elements;
    }

    public void setIds(Collection<IdClassDTO> ids) {
        this.elements = ids;
    }
}

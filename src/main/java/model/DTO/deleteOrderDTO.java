package model.DTO;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class deleteOrderDTO implements java.io.Serializable {
    private static final long serialVersionUID = 0L;

    private Integer orderId;

    @JsonCreator
    public deleteOrderDTO(@JsonProperty("id") Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
}

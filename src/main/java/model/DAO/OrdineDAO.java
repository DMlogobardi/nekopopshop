package model.DAO;

import model.Bean.OrdineBean;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

public class OrdineDAO implements GenralDAO<OrdineBean>{
    private static final String TABLE_NAME = "ordine";
    private DataSource ds = null;
    private List<String> ordineWhiteList = List.of("idOrdine", "tot", "dataOrdine", "dataArrivoS", "idCliente", "idMetodoPag");

    public OrdineDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public void doSave(OrdineBean bean) throws SQLException {

    }

    @Override
    public boolean doDelete(int code) throws SQLException {
        return false;
    }

    @Override
    public OrdineBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }

    @Override
    public Collection<OrdineBean> doRetrieveAll(String order) throws SQLException {
        return List.of();
    }

    @Override
    public Collection<OrdineBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        return List.of();
    }
}

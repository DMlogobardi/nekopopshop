package model.DAO;

import model.Bean.IndirizzoBean;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

public class IndirizzoDAO implements GenralDAO<IndirizzoBean>{
    private static final String TABLE_NAME = "indirizzo";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idIndirizzo", "via", "nCivico", "cap", "idCliente");

    public IndirizzoDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public void doSave(IndirizzoBean bean) throws SQLException {

    }

    @Override
    public boolean doDelete(int code) throws SQLException {
        return false;
    }

    @Override
    public IndirizzoBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }

    @Override
    public Collection<IndirizzoBean> doRetrieveAll(String order) throws SQLException {
        return List.of();
    }

    @Override
    public Collection<IndirizzoBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        return List.of();
    }
}

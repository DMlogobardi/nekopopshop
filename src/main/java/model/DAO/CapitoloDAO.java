package model.DAO;

import model.Bean.CapitoloBean;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

public class CapitoloDAO implements GenralDAO<CapitoloBean>{
    private static final String TABLE_NAME = "capitolo";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idCapitolo", "numCapitolo", "dataPub", "idVolume");

    public CapitoloDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public void doSave(CapitoloBean bean) throws SQLException {

    }

    @Override
    public boolean doDelete(int code) throws SQLException {
        return false;
    }

    @Override
    public CapitoloBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }

    @Override
    public Collection<CapitoloBean> doRetrieveAll(String order) throws SQLException {
        return List.of();
    }
}

package model.DAO;

import java.sql.SQLException;
import java.util.Collection;

public interface GenralDAO<T>{

    public void doSave(T bean) throws SQLException;

    public boolean doDelete(int code) throws SQLException;

    public T doRetrieveByKey(int code) throws SQLException;

    public Collection<T> doRetrieveAll(String order) throws SQLException;

    public Collection<T> doRetrieveAllLimit(String order, int limit, int page) throws SQLException;
}

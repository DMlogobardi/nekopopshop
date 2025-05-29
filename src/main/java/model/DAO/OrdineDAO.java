package model.DAO;

import model.Bean.OrdineBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class OrdineDAO implements GenralDAO<OrdineBean>{
    private static final String TABLE_NAME = "ordine";
    private DataSource ds = null;
    private List<String> ordineWhiteList = List.of("idOrdine", "tot", "dataOrdine", "dataArrivoS", "idCliente", "idMetodoPag");

    public OrdineDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(OrdineBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "insert into " + TABLE_NAME + "(tot, dataOrdine, dataArrivoS, idCliente, idMetodoPag)" + " values(?,?,?,?,?)";

        try{
          con = ds.getConnection();
          ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
          ps.setDouble(1, bean.getTot());
          ps.setString(2, bean.getDataOrdineFormatted().toString());
          ps.setString(3, bean.getDataArrivoFormatted().toString());
          ps.setInt(4, bean.getIdCliente());
          ps.setInt(5, bean.getIdMetodoPag());

          ps.executeUpdate();
          ResultSet rs = ps.getGeneratedKeys();
          rs.next();
          id = rs.getInt(1);
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return id;
    }

    @Override
    public boolean doDelete(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String deleteSQL = "delete from " + TABLE_NAME + " where idOrdine = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(deleteSQL);
            ps.setInt(1, code);

            result = ps.executeUpdate();
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return(result != 0);
    }

    @Override
    public OrdineBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        OrdineBean ordine = null;

        String selectSQL = "select * from " + TABLE_NAME + " where idOrdine = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ordine = new OrdineBean(
                        rs.getInt("idOrdine"),
                        rs.getDouble("tot"),
                        rs.getString("dataOrdine"),
                        rs.getString("dataArrivoS"),
                        rs.getInt("idCliente"),
                        rs.getInt("idMetodoPag")
                );
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return ordine;
    }

    @Override
    public Collection<OrdineBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<OrdineBean> ordini = new LinkedList<OrdineBean>();

        String selectAllSQL = "select * from " + TABLE_NAME;
        if(order != null && ordineWhiteList.contains(order.strip())){
            selectAllSQL += " order by " + order.strip();
        }
        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrdineBean ordine = new OrdineBean(
                        rs.getInt("idOrdine"),
                        rs.getDouble("tot"),
                        rs.getString("dataOrdine"),
                        rs.getString("dataArrivoS"),
                        rs.getInt("idCliente"),
                        rs.getInt("idMetodoPag")
                );
                ordini.add(ordine);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return ordini;
    }

    @Override
    public Collection<OrdineBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<OrdineBean> ordini = new LinkedList<OrdineBean>();

        String selectAllSQL = "select * from " + TABLE_NAME;
        if(order != null && ordineWhiteList.contains(order.strip())){
            selectAllSQL += " order by " + order.strip();
        }
        if(limit > 0 && page > 0){
            selectAllSQL += " limit " + limit + " offset " + (page - 1) * limit;
        }
        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrdineBean ordine = new OrdineBean(
                        rs.getInt("idOrdine"),
                        rs.getDouble("tot"),
                        rs.getString("dataOrdine"),
                        rs.getString("dataArrivoS"),
                        rs.getInt("idCliente"),
                        rs.getInt("idMetodoPag")
                );
                ordini.add(ordine);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return ordini;
    }
}

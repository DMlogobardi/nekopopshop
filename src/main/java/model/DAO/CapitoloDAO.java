package model.DAO;

import model.Bean.CapitoloBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
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
        Connection con = null;
        PreparedStatement ps = null;

        String insertSQL = "INSERT INTO " + TABLE_NAME + "(numCapitolo, dataPub, idVolume)" + " VALUES (?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL);
            ps.setFloat(1, bean.getNumCapitolo());
            ps.setString(2, bean.getDataPubFormatted().toString());
            ps.setInt(3, bean.getIdVolume());

            ps.executeUpdate();

        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
    }

    @Override
    public boolean doDelete(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE code = ?";

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
    public CapitoloBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        CapitoloBean cap = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE code = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cap = new CapitoloBean(rs.getInt("idCapitolo"), rs.getFloat("numCapitolo"), rs.getDate("dataPub").toString(), rs.getInt("idVolume"));
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return cap;
    }

    @Override
    public Collection<CapitoloBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<CapitoloBean> capitoli = new LinkedList<CapitoloBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME;
        if( order != null && orderWhiteList.contains(order.strip())) {
            selectAllSQL += " ORDER BY " + order.strip();
        }
        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CapitoloBean cap = new CapitoloBean(rs.getInt("idCapitolo"), rs.getFloat("numCapitolo"), rs.getDate("dataPub").toString(), rs.getInt("idVolume"));
                capitoli.add(cap);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return capitoli;
    }

    @Override
    public Collection<CapitoloBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<CapitoloBean> capitoli = new LinkedList<CapitoloBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME;
        if( order != null && orderWhiteList.contains(order.strip())) {
            selectAllSQL += " ORDER BY " + order.strip();
        }
        if(limit > 0 && page > 0){
            selectAllSQL += " limit " + limit + " offset " + (page - 1) * limit;
        }
        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CapitoloBean cap = new CapitoloBean(rs.getInt("idCapitolo"), rs.getFloat("numCapitolo"), rs.getDate("dataPub").toString(), rs.getInt("idVolume"));
                capitoli.add(cap);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return capitoli;
    }
}

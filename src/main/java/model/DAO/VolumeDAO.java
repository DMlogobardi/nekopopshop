package model.DAO;

import model.Bean.VolumeBean;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class VolumeDAO implements GenralDAO<VolumeBean>{
    private static final String TABLE_NAME = "volume";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idVolume", "numVolumi", "prezzo", "Quantità", "dataPubl", "idProdotto");

    public VolumeDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public void doSave(VolumeBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;

        String insertSQL = "INSERT INTO " + TABLE_NAME + "(numVolumi, prezzo, Quantità, dataPubl, imgVol, idProdotto)" + " VALUES (?,?,?,?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL);
            ps.setInt(1, bean.getNumVolumi());
            ps.setDouble(2, bean.getPrezzo());
            ps.setInt(3, bean.getQuantita());
            ps.setString(4, bean.getDataPublFormatted().toString());
            ps.setBytes(5, bean.getImgVol());
            ps.setInt(5, bean.getIdProdotto());

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

        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE idVolume = ?";

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
    public VolumeBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        VolumeBean volume = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idVolume = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                volume = new VolumeBean(
                        rs.getInt("idVolume"),
                        rs.getInt("numVolumi"),
                        rs.getDouble("prezzo"),
                        rs.getInt("quantità"),
                        rs.getString("dataPubl"),
                        rs.getBytes("imgVol"),
                        rs.getInt("idProdotto")
                );
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return volume;
    }

    @Override
    public Collection<VolumeBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<VolumeBean> volumes = new LinkedList<VolumeBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME;
        if(order != null && orderWhiteList.contains(order.strip())){
            selectAllSQL += " ORDER BY " + order.strip();
        }
        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                VolumeBean volume = new VolumeBean(
                        rs.getInt("idVolume"),
                        rs.getInt("numVolumi"),
                        rs.getDouble("prezzo"),
                        rs.getInt("quantità"),
                        rs.getString("dataPubl"),
                        rs.getBytes("imgVol"),
                        rs.getInt("idProdotto")
                );
                volumes.add(volume);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return volumes;
    }

    @Override
    public Collection<VolumeBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<VolumeBean> volumes = new LinkedList<VolumeBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME;
        if(order != null && orderWhiteList.contains(order.strip())){
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
                VolumeBean volume = new VolumeBean(
                        rs.getInt("idVolume"),
                        rs.getInt("numVolumi"),
                        rs.getDouble("prezzo"),
                        rs.getInt("quantità"),
                        rs.getString("dataPubl"),
                        rs.getBytes("imgVol"),
                        rs.getInt("idProdotto")
                );
                volumes.add(volume);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return volumes;
    }
}

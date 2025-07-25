package model.DAO;

import model.Bean.CapitoloBean;
import model.Bean.VolumeBean;

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
    public int doSave(CapitoloBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "INSERT INTO " + TABLE_NAME + "(numCapitolo, dataPub, idVolume)" + " VALUES (?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setFloat(1, bean.getNumCapitolo());
            ps.setString(2, bean.getDataPubFormatted().toString());
            ps.setInt(3, bean.getIdVolume());

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

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if( order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idCapitolo");

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

    public Collection<CapitoloBean> doRetrieveAllByVol(String order, int vol) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<CapitoloBean> capitoli = new LinkedList<CapitoloBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " where idVolume = ? ORDER BY ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ps.setInt(1, vol);
            if( order != null && orderWhiteList.contains(order.strip()))
                ps.setString(2, order.strip());
            else
                ps.setString(2, "idCapitolo");

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

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY ? LIMIT ? OFFSET ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if( order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idCapitolo");

            if (limit > 0 && page > 0) {
                ps.setInt(2, limit);
                ps.setInt(3, (page - 1) * limit);
            } else if (page > 0 && limit <= 0) {
                ps.setInt(2, 10);
                ps.setInt(3, (page - 1) * limit);
            } else if (limit > 0 && page <= 0) {
                ps.setInt(2, limit);
                ps.setInt(3, 0);
            } else {
                ps.setInt(2, 10);
                ps.setInt(3, 0);
            }

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

    public Collection<CapitoloBean> doRetrieveAllLimitByVol(String order, int limit, int page, int idVol) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<CapitoloBean> capitoli = new LinkedList<CapitoloBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " where idVolume = ?  ORDER BY ? LIMIT ? OFFSET ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ps.setInt(1, idVol);
            if( order != null && orderWhiteList.contains(order.strip()))
                ps.setString(2, order.strip());
            else
                ps.setString(2, "idCapitolo");

            if (limit > 0 && page > 0) {
                ps.setInt(3, limit);
                ps.setInt(4, (page - 1) * limit);
            } else if (page > 0 && limit <= 0) {
                ps.setInt(3, 10);
                ps.setInt(4, (page - 1) * limit);
            } else if (limit > 0 && page <= 0) {
                ps.setInt(3, limit);
                ps.setInt(4, 0);
            } else {
                ps.setInt(3, 10);
                ps.setInt(4, 0);
            }

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

    public boolean uppdate(CapitoloBean cap) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String updateSQL = "update " + TABLE_NAME + " set numCapitolo = ?, dataPub = ?, idVolume = ? where idVolume = ? and numCapitolo = ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(updateSQL);
            ps.setFloat(1, cap.getNumCapitolo());
            ps.setDate(2, cap.getDataPubFormatted());
            ps.setInt(3, cap.getIdVolume());
            ps.setInt(4, cap.getIdVolume());
            ps.setFloat(5, cap.getNumCapitolo());

            result = ps.executeUpdate();
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return (result != 0);
    }
}

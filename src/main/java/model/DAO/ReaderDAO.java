package model.DAO;

import model.Bean.ReaderBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class ReaderDAO implements GenralDAO<ReaderBean>{
    private static final String TABLE_NAME = "reader";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idReader", "dataAcquisto", "dataUltimaApertura", "idVolume", "idCliente");

    public ReaderDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(ReaderBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = " insert into " + TABLE_NAME + "(dataAcquisto, dataUltimaApertura, idVolume, idCliente)" + "values(?,?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setDate(1, bean.getDataAcquistoFormatted());
            if(bean.getDataUltimaApertura() != null)
                ps.setDate(2, bean.getDataUltimaAperturaFormatted());
            else
                ps.setNull(2, java.sql.Types.DATE);
            ps.setInt(3, bean.getIdVolume());
            ps.setInt(4, bean.getIdCliente());

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

        String deleteSQL = "delete from " + TABLE_NAME + " where idReader=?";

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
    public ReaderBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ReaderBean reader = null;

        String selectSQL = "select * from " + TABLE_NAME + " where idReader=?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                reader = new ReaderBean(
                        rs.getInt("idReader"),
                        rs.getString("dataAcquisto"),
                        rs.getString("dataUltimaApertura"),
                        rs.getInt("idVolume"),
                        rs.getInt("idCliente")
                );
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return reader;
    }

    public ReaderBean doRetrieveByVolAndUtent(int code, int utent) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ReaderBean reader = null;

        String selectSQL = "select * from " + TABLE_NAME + " where idVolume=? and idCliente = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);
            ps.setInt(2, utent);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                reader = new ReaderBean(
                        rs.getInt("idReader"),
                        rs.getString("dataAcquisto"),
                        rs.getString("dataUltimaApertura"),
                        rs.getInt("idVolume"),
                        rs.getInt("idCliente")
                );
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return reader;
    }

    @Override
    public Collection<ReaderBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ReaderBean> readers = new LinkedList<ReaderBean>();

        String selectAllSQL = "select * from " + TABLE_NAME + " order by ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idReader");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ReaderBean reader = new ReaderBean(
                        rs.getInt("idReader"),
                        rs.getString("dataAcquisto"),
                        rs.getString("dataUltimaApertura"),
                        rs.getInt("idVolume"),
                        rs.getInt("idCliente")
                );
                readers.add(reader);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return readers;
    }

    public Collection<ReaderBean> doRetrieveAllByUtent(String order, int cliente) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ReaderBean> readers = new LinkedList<ReaderBean>();

        String selectAllSQL = "select * from " + TABLE_NAME + " where idCliente = ? order by ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ps.setInt(1, cliente);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(2, order.strip());
            else
                ps.setString(2, "idReader");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ReaderBean reader = new ReaderBean(
                        rs.getInt("idReader"),
                        rs.getString("dataAcquisto"),
                        rs.getString("dataUltimaApertura"),
                        rs.getInt("idVolume"),
                        rs.getInt("idCliente")
                );
                readers.add(reader);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return readers;
    }

    @Override
    public Collection<ReaderBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ReaderBean> readers = new LinkedList<ReaderBean>();

        String selectAllSQL = "select * from " + TABLE_NAME + " order by ? limit ? offset ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idReader");

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
                ReaderBean reader = new ReaderBean(
                        rs.getInt("idReader"),
                        rs.getString("dataAcquisto"),
                        rs.getString("dataUltimaApertura"),
                        rs.getInt("idVolume"),
                        rs.getInt("idCliente")
                );
                readers.add(reader);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return readers;
    }
}

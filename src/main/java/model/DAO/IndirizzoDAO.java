package model.DAO;

import model.Bean.IndirizzoBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class IndirizzoDAO implements GenralDAO<IndirizzoBean>{
    private static final String TABLE_NAME = "indirizzo";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idIndirizzo", "via", "nCivico", "cap", "idCliente");

    public IndirizzoDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(IndirizzoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "INSERT INTO " + TABLE_NAME + "(via, nCivico, cap, idCliente)" + " VALUES (?,?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, bean.getVia());
            ps.setInt(2, bean.getnCivico());
            ps.setString(3, bean.getCap());
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

        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE idIndirizzo = ?";

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

    public boolean doDeleteByIdAndCliente(int code, int cliente) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE idIndirizzo = ? and idCliente = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(deleteSQL);
            ps.setInt(1, code);
            ps.setInt(2, cliente);

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
    public IndirizzoBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        IndirizzoBean indirizzo = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idIndirizzo = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                indirizzo = new IndirizzoBean(
                        rs.getInt("idIndirizzo"),
                        rs.getString("via"),
                        rs.getInt("nCivico"),
                        rs.getString("cap"),
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
        return indirizzo;
    }

    @Override
    public Collection<IndirizzoBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<IndirizzoBean> indirizzi = new LinkedList<IndirizzoBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idIndirizzo");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                IndirizzoBean indirizzo = new IndirizzoBean(
                        rs.getInt("idIndirizzo"),
                        rs.getString("via"),
                        rs.getInt("nCivico"),
                        rs.getString("cap"),
                        rs.getInt("idCliente")
                );
                indirizzi.add(indirizzo);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return indirizzi;
    }

    @Override
    public Collection<IndirizzoBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<IndirizzoBean> indirizzi = new LinkedList<IndirizzoBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY ? LIMIT ? OFFSET ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idIndirizzo");

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
                IndirizzoBean indirizzo = new IndirizzoBean(
                        rs.getInt("idIndirizzo"),
                        rs.getString("via"),
                        rs.getInt("nCivico"),
                        rs.getString("cap"),
                        rs.getInt("idCliente")
                );
                indirizzi.add(indirizzo);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return indirizzi;
    }

    public Collection<IndirizzoBean> doRetrieveByCliente(int logId) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<IndirizzoBean> indirizzi = new LinkedList<IndirizzoBean>();

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idCliente=?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, logId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                IndirizzoBean indirizzo = new IndirizzoBean(
                        rs.getInt("idIndirizzo"),
                        rs.getString("via"),
                        rs.getInt("nCivico"),
                        rs.getString("cap"),
                        rs.getInt("idCliente")
                );
                indirizzi.add(indirizzo);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return indirizzi;
    }

    public IndirizzoBean doRetrieveByKeyAndCliente(int code, int logId) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        IndirizzoBean indirizzo = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idIndirizzo=? and idCliente=?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);
            ps.setInt(2, logId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                indirizzo = new IndirizzoBean(
                        rs.getInt("idIndirizzo"),
                        rs.getString("via"),
                        rs.getInt("nCivico"),
                        rs.getString("cap"),
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
        return indirizzo;
    }

    public Boolean update(IndirizzoBean indirizzo) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String updateSQL = "update " + TABLE_NAME + " set via = ?, nCivico = ?, cap = ? where idIndirizzo = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(updateSQL);
            ps.setString(1, indirizzo.getVia());
            ps.setInt(2, indirizzo.getnCivico());
            ps.setString(3, indirizzo.getCap());
            ps.setInt(4, indirizzo.getIdIndirizzo());

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

package model.DAO;

import model.Bean.NumTelefonoBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class NumtelefonoDAO implements GenralDAO<NumTelefonoBean>{
    private static final String TABLE_NAME = "numtelefono";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idTelefono", "prefisso", "numero", "idCliente");

    public NumtelefonoDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(NumTelefonoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "INSERT INTO " + TABLE_NAME + "(prefisso, numero, idCliente)" + " VALUES (?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, bean.getPrefisso());
            ps.setString(2, bean.getNumero());
            ps.setInt(3, bean.getIdCliente());

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

        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE idTelefono = ?";

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
    public NumTelefonoBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        NumTelefonoBean tel = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idTelefono = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                tel = new NumTelefonoBean(
                        rs.getInt("idTelefono"),
                        rs.getString("prefisso"),
                        rs.getString("numero"),
                        rs.getInt("idCliente")
                );
            }
        }  finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return tel;
    }

    @Override
    public Collection<NumTelefonoBean> doRetrieveAll(String order) throws SQLException {
       Connection con = null;
       PreparedStatement ps = null;
       Collection<NumTelefonoBean> tels = new LinkedList<NumTelefonoBean>();

       String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY ?";

       try{
           con = ds.getConnection();
           ps = con.prepareStatement(selectAllSQL);
           if(order != null && orderWhiteList.contains(order.strip()))
               ps.setString(1, order.strip());
           else
               ps.setString(1, "idTelefono");

           ResultSet rs = ps.executeQuery();
           while(rs.next()){
               NumTelefonoBean tel = new NumTelefonoBean(
                       rs.getInt("idTelefono"),
                       rs.getString("prefisso"),
                       rs.getString("numero"),
                       rs.getInt("idCliente")
               );
               tels.add(tel);
           }
       }  finally {
           try {
               if (ps != null) ps.close();
           } finally {
               if (con != null) con.close();
           }
       }
       return tels;
    }

    @Override
    public Collection<NumTelefonoBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<NumTelefonoBean> tels = new LinkedList<NumTelefonoBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY ? LIMIT ? OFFSET ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idTelefono");

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
            while(rs.next()){
                NumTelefonoBean tel = new NumTelefonoBean(
                        rs.getInt("idTelefono"),
                        rs.getString("prefisso"),
                        rs.getString("numero"),
                        rs.getInt("idCliente")
                );
                tels.add(tel);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return tels;
    }
}

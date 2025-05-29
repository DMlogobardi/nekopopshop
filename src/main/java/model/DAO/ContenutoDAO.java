package model.DAO;

import model.Bean.ContenutoBean;
import model.Bean.ProdottoBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class ContenutoDAO implements GenralDAO<ContenutoBean>{
    private static final String TABLE_NAME = "contenuto";
    private DataSource ds = null;
    private List<String> orderWhiteLst = List.of("idContenuto","qCarrello", "idCarrello", "idProdotto", "idVolume");

    public ContenutoDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int  doSave(ContenutoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;
        String insertSQL = " insert into " + TABLE_NAME + "(qCarrello, idCarrello, idProdotto, idVolume) values (?,?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, bean.getqCarrello());
            ps.setInt(2, bean.getIdCarrello());
            ps.setInt(3, bean.getIdProdotto());
            ps.setInt(4, bean.getIdVolume());

            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            id = rs.getInt(1);
        }  finally {
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

        String deleteSQL = "delete from " + TABLE_NAME + " where idContenuto = ?";

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
    public ContenutoBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ContenutoBean contenuto = null;

        String selectSQL = "select * from " + TABLE_NAME + " where idContenuto = ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                contenuto = new ContenutoBean(
                        rs.getInt("idContenuto"),
                        rs.getInt("qCarrello"),
                        rs.getInt("idCarrello"),
                        rs.getInt("idProdotto"),
                        rs.getInt("idVolume")
                );
            }
        }  finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return contenuto;
    }

    public Collection<ContenutoBean> doRetrieveAllproduct(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ContenutoBean> contenuti = new LinkedList<ContenutoBean>();

        String selectSQL = "select * from " + TABLE_NAME + " where idCarrello = ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ContenutoBean conte = new ContenutoBean(
                        rs.getInt("idContenuto"),
                        rs.getInt("qContenuto"),
                        rs.getInt("idCarrello"),
                        rs.getInt("idProdotto"),
                        rs.getInt("idVolume")
                );
                contenuti.add(conte);
            }
        }  finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return contenuti;
    }

    @Override
    public Collection<ContenutoBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ContenutoBean> contenuti = new LinkedList<ContenutoBean>();

        String selectAllSQL = "select * from " + TABLE_NAME;
        if(order != null && orderWhiteLst.contains(order.strip())){
            selectAllSQL += " order by " + order.strip();
        }
        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ContenutoBean contenuto = new ContenutoBean(
                        rs.getInt("idContenuto"),
                        rs.getInt("qCarrello"),
                        rs.getInt("idCarrello"),
                        rs.getInt("idProdotto"),
                        rs.getInt("idVolume")
                );
                contenuti.add(contenuto);
            }
        }  finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return contenuti;
    }

    public Collection<ContenutoBean> doRetrieveAll(String order, int id) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ContenutoBean> contenuti = new LinkedList<ContenutoBean>();

        String selectAllSQL = "select * from " + TABLE_NAME + " where idCarrello = ?";
        if(order != null && orderWhiteLst.contains(order.strip())){
            selectAllSQL += " order by " + order.strip();
        }
        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ContenutoBean contenuto = new ContenutoBean(
                        rs.getInt("idContenuto"),
                        rs.getInt("qCarrello"),
                        rs.getInt("idCarrello"),
                        rs.getInt("idProdotto"),
                        rs.getInt("idVolume")
                );
                contenuti.add(contenuto);
            }
        }  finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return contenuti;
    }

    @Override
    public Collection<ContenutoBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ContenutoBean> contenuti = new LinkedList<ContenutoBean>();

        String selectAllSQL = "select * from " + TABLE_NAME;
        if(order != null && orderWhiteLst.contains(order.strip())){
            selectAllSQL += " order by " + order.strip();
        }
        if(limit > 0 && page > 0){
            selectAllSQL += " limit " + limit + " offset " + (page - 1) * limit;
        }
        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ContenutoBean contenuto = new ContenutoBean(
                        rs.getInt("idContenuto"),
                        rs.getInt("qCarrello"),
                        rs.getInt("idCarrello"),
                        rs.getInt("idProdotto"),
                        rs.getInt("idVolume")
                );
                contenuti.add(contenuto);
            }
        }  finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return contenuti;
    }
}

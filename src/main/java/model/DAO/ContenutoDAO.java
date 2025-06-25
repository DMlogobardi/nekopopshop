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
    private List<String> orderWhiteLst = List.of("idContenuto","quantita", "idCarrello", "idProdotto", "idVolume");

    public ContenutoDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int  doSave(ContenutoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;
        String insertSQL = " insert into " + TABLE_NAME + "(quantita, idCarrello, idProdotto, idVolume) values (?,?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, bean.getqCarrello());
            ps.setInt(2, bean.getIdCarrello());
            if(bean.getIdProdotto() != null) {
                ps.setInt(3, bean.getIdProdotto());
            } else {
                ps.setNull(3, Types.INTEGER);
            }
            if(bean.getIdVolume() != null) {
                ps.setInt(4, bean.getIdVolume());
            } else {
                ps.setNull(4, Types.INTEGER);
            }

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

    public boolean doDeleteByCart(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String deleteSQL = "delete from " + TABLE_NAME + " where idCarrello = ?";

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
                        rs.getInt("quantita"),
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
                        rs.getInt("quantita"),
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

        String selectAllSQL = "select * from " + TABLE_NAME + " order by ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteLst.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idContenuto");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ContenutoBean contenuto = new ContenutoBean(
                        rs.getInt("idContenuto"),
                        rs.getInt("quantita"),
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

        String selectAllSQL = "select * from " + TABLE_NAME + " where idCarrello = ?  order by ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ps.setInt(1, id);
            if(order != null && orderWhiteLst.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idContenuto");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ContenutoBean contenuto = new ContenutoBean(
                        rs.getInt("idContenuto"),
                        rs.getInt("quantita"),
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

        String selectAllSQL = "select * from " + TABLE_NAME + " order by ? limit ? offset ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteLst.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idContenuto");

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
                ContenutoBean contenuto = new ContenutoBean(
                        rs.getInt("idContenuto"),
                        rs.getInt("quantita"),
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

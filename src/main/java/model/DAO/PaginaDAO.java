package model.DAO;

import model.Bean.PaginaBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class PaginaDAO implements GenralDAO<PaginaBean>{
    private static final String TABLE_NAME = "pagina";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idPagina", "numPag", "dataCaricamento", "idCapitolo");

    public PaginaDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(PaginaBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "insert into" + TABLE_NAME + "(numPag, dataCaricamento, tavola,idCapitolo)" + " values(?,?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, bean.getNumPag());
            ps.setString(2, bean.getDataCaricamentoFormatted().toString());
            ps.setBytes(3, bean.getTavola());
            ps.setInt(4, bean.getIdCapitolo());

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

        String deleteSQL = "delete from " + TABLE_NAME + " where idPagina = ?";

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
    public PaginaBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        PaginaBean pag = null;

        String selectSQL = "select * from " + TABLE_NAME + " where idPagina = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                pag = new PaginaBean(
                        rs.getInt("idPagina"),
                        rs.getInt("numPag"),
                        rs.getBytes("tavola"),
                        rs.getString("dataCaricamento"),
                        rs.getInt("idCapitolo")
                );
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return pag;
    }

    @Override
    public Collection<PaginaBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<PaginaBean> pages = new LinkedList<PaginaBean>();

        String selectAllSQL = "select * from " + TABLE_NAME + " order by ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idPagina");

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                PaginaBean pag = new PaginaBean(
                        rs.getInt("idPagina"),
                        rs.getInt("numPag"),
                        rs.getBytes("tavola"),
                        rs.getString("dataCaricamento"),
                        rs.getInt("idCapitolo")
                );
                pages.add(pag);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return pages;
    }

    public Collection<PaginaBean> doRetrieveAllByCapitolo(String order, int id) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<PaginaBean> pages = new LinkedList<PaginaBean>();

        String selectAllSQL = "select * from " + TABLE_NAME + " where idCapitolo = ?  order by ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ps.setInt(1, id);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(2, order.strip());
            else
                ps.setString(2, "idPagina");

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                PaginaBean pag = new PaginaBean(
                        rs.getInt("idPagina"),
                        rs.getInt("numPag"),
                        rs.getBytes("tavola"),
                        rs.getString("dataCaricamento"),
                        rs.getInt("idCapitolo")
                );
                pages.add(pag);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return pages;
    }

    @Override
    public Collection<PaginaBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<PaginaBean> pages = new LinkedList<PaginaBean>();

        String selectAllSQL = "select * from " + TABLE_NAME + " order by ? limit ? offset ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idPagina");

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
                PaginaBean pag = new PaginaBean(
                        rs.getInt("idPagina"),
                        rs.getInt("numPag"),
                        rs.getBytes("tavola"),
                        rs.getString("dataCaricamento"),
                        rs.getInt("idCapitolo")
                );
                pages.add(pag);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return pages;
    }
}

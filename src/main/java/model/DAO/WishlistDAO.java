package model.DAO;

import model.Bean.WishlistBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class WishlistDAO implements GenralDAO<WishlistBean>{
    private static final String TABLE_NAME = "wishlist";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idWishList", "idProdotto", "idCliente");

    public WishlistDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(WishlistBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "insert into" + TABLE_NAME + "(idProdotto, idCliente) values (?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, bean.getIdProdotto());
            ps.setInt(2, bean.getIdCliente());

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

        String deleteSQL = "delete from " + TABLE_NAME + " where idWishList = ?";

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
    public WishlistBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        WishlistBean wishL = null;

        String selectSQL = "select * from " + TABLE_NAME + " where idWishList = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                wishL = new WishlistBean(
                        rs.getInt("idWishList"),
                        rs.getInt("idProdotto"),
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
        return wishL;
    }

    @Override
    public Collection<WishlistBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<WishlistBean> wishLs = new LinkedList<WishlistBean>();

        String selectAllSQL = "select * from " + TABLE_NAME;
        if(order != null && orderWhiteList.contains(order.strip())){
            selectAllSQL += " order by " + order.strip();
        }
        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               WishlistBean wishL = new WishlistBean(
                       rs.getInt("idWishList"),
                       rs.getInt("idProdotto"),
                       rs.getInt("idCliente")
               );
               wishLs.add(wishL);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return wishLs;
    }

    @Override
    public Collection<WishlistBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<WishlistBean> wishLs = new LinkedList<WishlistBean>();

        String selectAllSQL = "select * from " + TABLE_NAME;
        if(order != null && orderWhiteList.contains(order.strip())){
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
                WishlistBean wishL = new WishlistBean(
                        rs.getInt("idWishList"),
                        rs.getInt("idProdotto"),
                        rs.getInt("idCliente")
                );
                wishLs.add(wishL);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return wishLs;
    }
}

package model.DAO;

import model.Bean.ProdottoBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class ProdottoDAO implements GenralDAO<ProdottoBean>{
    private static final String TABLE_NAME = "prodotto";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idProdotto", "nome", "quantità", "prezzo", "autore", "descrizione");

    public ProdottoDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(ProdottoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "INSERT INTO " + TABLE_NAME + "(nome, quantità, prezzo, autore, imgProd, descrizione)" +" VALUES (?,?,?,?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, bean.getNome());
            ps.setInt(2,bean.getQuantita());
            ps.setDouble(3,bean.getPrezzo());
            ps.setString(4,bean.getAutore());
            ps.setBytes(5,bean.getImgProd());
            ps.setString(6,bean.getDescrizione());

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

        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE idProdotto = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(deleteSQL);
            ps.setInt(1,code);

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
    public ProdottoBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ProdottoBean prod = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idProdotto = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1,code);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                prod = new ProdottoBean(
                        rs.getInt("idProdotto"),
                        rs.getString("nome"),
                        rs.getInt("quantità"),
                        rs.getDouble("prezzo"),
                        rs.getString("autore"),
                        rs.getBytes("imgProd"),
                        rs.getString("descrizione")
                );
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return prod;
    }

    @Override
    public Collection<ProdottoBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME;
        if(order != null && orderWhiteList.contains(order.strip())){
            selectAllSQL += " ORDER BY " + order.strip();
        }
        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ProdottoBean prod = new ProdottoBean(
                        rs.getInt("idProdotto"),
                        rs.getString("nome"),
                        rs.getInt("quantità"),
                        rs.getDouble("prezzo"),
                        rs.getString("autore"),
                        rs.getBytes("imgProd"),
                        rs.getString("descrizione")
                );
                prodotti.add(prod);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return prodotti;
    }

    @Override
    public Collection<ProdottoBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();

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
            while(rs.next()){
                ProdottoBean prod = new ProdottoBean(
                        rs.getInt("idProdotto"),
                        rs.getString("nome"),
                        rs.getInt("quantità"),
                        rs.getDouble("prezzo"),
                        rs.getString("autore"),
                        rs.getBytes("imgProd"),
                        rs.getString("descrizione")
                );
                prodotti.add(prod);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return prodotti;
    }

    public Collection<ProdottoBean> doRetrieveAllLimitLike(String order, int limit, int page, String serch) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME;
        if(!serch.isEmpty()){
            selectAllSQL += " WHERE LOWER(nome) " + " LIKE " + "'%" + serch.toLowerCase() + "%'";
        }
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
            while(rs.next()){
                ProdottoBean prod = new ProdottoBean(
                        rs.getInt("idProdotto"),
                        rs.getString("nome"),
                        rs.getInt("quantità"),
                        rs.getDouble("prezzo"),
                        rs.getString("autore"),
                        rs.getBytes("imgProd"),
                        rs.getString("descrizione")
                );
                prodotti.add(prod);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return prodotti;
    }
}


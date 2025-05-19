package model.DAO;

import model.Bean.ContenutoBean;
import model.Bean.ProdottoBean;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class ContenutoDAO implements GenralDAO<ContenutoBean>{
    private static final String TABLE_NAME = "contenuto";
    private DataSource ds = null;
    private List<String> orderWhiteLst = List.of("idCarrello", "idProdotto");

    public ContenutoDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public void doSave(ContenutoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;

        String insertSQL = " insert into " + TABLE_NAME + "(idCarrello,idProdotto) values (?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL);
            ps.setInt(1, bean.getIdCarrello());
            ps.setInt(2, bean.getIdProdotto());

            ps.executeUpdate();
        }  finally {
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
                        rs.getInt("idCarrello"),
                        rs.getInt("idProdotto")
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

    public Collection<ProdottoBean> doRetrieveAllproduct(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();

        String selectSQL = "select * from " + TABLE_NAME + " where idCarrello = ? join prodotto on " + TABLE_NAME +".idContenuto = prodotto.idProdotto";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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
        }  finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return prodotti;
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
                        rs.getInt("idCarrello"),
                        rs.getInt("idProdotto")
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
                        rs.getInt("idCarrello"),
                        rs.getInt("idProdotto")
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

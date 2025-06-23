package model.DAO;

import model.Bean.ProdottoBean;
import model.Bean.VolumeBean;
import model.DTO.BookDTO;

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
            if(bean.getQuantita() != null) {
                ps.setInt(2, bean.getQuantita());
            } else {
                ps.setNull(2, Types.INTEGER);
            }
            if(bean.getPrezzo() != null) {
                ps.setDouble(3, bean.getPrezzo());
            } else {
                ps.setNull(3, Types.DOUBLE);
            }
            ps.setString(4,bean.getAutore());
            if(bean.getImgProd() != null) {
                ps.setBytes(5,bean.getImgProd());
            } else {
                ps.setNull(5, Types.BLOB);
            }
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

    public ProdottoBean doRetrieveFigure() throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ProdottoBean prod = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE prezzo IS NOT NULL AND prezzo > 0.0 limit 1";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);

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

    public ProdottoBean doRetrieveByVol(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ProdottoBean prod = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idVolum = ?";

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

    public int doRetrieveQuantity(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String selectSQL = "SELECT quantita FROM " + TABLE_NAME + " WHERE idProdotto = ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("quantita");
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return result;
    }

    @Override
    public Collection<ProdottoBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip())){
                ps.setString(1, order.strip());
            }

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

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY ? limit ? offset ?" ;

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip())){
                ps.setString(1, order.strip());
            } else {
                ps.setString(1, "idProdotto");
            }
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
        if (!serch.isEmpty()) {
            selectAllSQL += " WHERE LOWER(nome) LIKE ?  ORDER BY ? ";
        }
        selectAllSQL += " LIMIT ? OFFSET ?";


        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            ps.setString(1, "%" + serch.toLowerCase() + "%");

            if (order != null && orderWhiteList.contains(order.strip())) {
                ps.setString(2, order.strip());
            } else {
                ps.setString(2, "idProdotto");
            }
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

    public boolean uppdate (ProdottoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String updateSQL = "update " + TABLE_NAME + " set nome = ?, quantità = ?, prezzo = ?, autore = ?, imgProd = ?, descrizione = ? where idProdotto = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(updateSQL);
            ps.setString(1, bean.getNome());
            if(bean.getQuantita() != null) {
                ps.setInt(2, bean.getQuantita());
            } else {
                ps.setNull(2, Types.INTEGER);
            }
            if(bean.getPrezzo() != null) {
                ps.setDouble(3, bean.getPrezzo());
            } else {
                ps.setNull(3, Types.DOUBLE);
            }
            ps.setString(4,bean.getAutore());
            if(bean.getImgProd() != null) {
                ps.setBytes(5,bean.getImgProd());
            } else {
                ps.setNull(5, Types.BLOB);
            }
            ps.setString(6,bean.getDescrizione());
            ps.setInt(7, bean.getIdProdotto());

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

    public boolean decrementQuantita (int quantita, int idProd) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String updateSQL = "update " + TABLE_NAME + " set quantità = quantità - ? where idProdotto = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(updateSQL);
            ps.setInt(1, quantita);
            ps.setInt(2, idProd);

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

    public Double doRetrievePrezzoByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        double prezzo = 0;

        String selectSQL = "SELECT prezzo FROM " + TABLE_NAME + " WHERE idProdotto = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1,code);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                prezzo = rs.getDouble("prezzo");
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return prezzo;
    }
}


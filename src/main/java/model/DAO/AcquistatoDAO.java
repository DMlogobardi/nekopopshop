package model.DAO;

import model.Bean.AcquistatoBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class AcquistatoDAO implements GenralDAO<AcquistatoBean>{
    private static final String TABLE_NAME = "acquistato";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idOrdine", "idProdotto");

    public AcquistatoDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(AcquistatoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "INSERT INTO" + TABLE_NAME + " (idOrdine, idProdotto) VALUES (?, ?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, bean.getIdOrdine());
            ps.setInt(2, bean.getIdProdotto());

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

        String deletSQL = "DELETE FROM " + TABLE_NAME + " WHERE idAcquistato = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(deletSQL);
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
    public AcquistatoBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        AcquistatoBean ac = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idAcquistato = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ac = new AcquistatoBean(rs.getInt("idAcquistato"), rs.getInt("idOrdine"), rs.getInt("idProdotto"));
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return ac;
    }

    @Override
    public Collection<AcquistatoBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<AcquistatoBean> acList = new LinkedList<AcquistatoBean>();

        String selectAllSQL = " SELECT * FROM " + TABLE_NAME;
        if(order != null && orderWhiteList.contains(order.strip())) {
            selectAllSQL += " ORDER BY " + order.strip();
        }

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                AcquistatoBean ac = new AcquistatoBean(rs.getInt("idAcquistato"), rs.getInt("idOrdine"), rs.getInt("idProdotto"));
                acList.add(ac);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return acList;
    }

    @Override
    public Collection<AcquistatoBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<AcquistatoBean> acList = new LinkedList<AcquistatoBean>();

        String selectAllSQL = " SELECT * FROM " + TABLE_NAME;
        if(order != null && orderWhiteList.contains(order.strip())) {
            selectAllSQL += " ORDER BY " + order.strip();
        }
        if(limit > 0 && page > 0){
            selectAllSQL += " limit " + limit + " offset " + (page - 1) * limit;
        }
        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                AcquistatoBean ac = new AcquistatoBean(rs.getInt("idAcquistato"), rs.getInt("idOrdine"), rs.getInt("idProdotto"));
                acList.add(ac);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return acList;
    }
}

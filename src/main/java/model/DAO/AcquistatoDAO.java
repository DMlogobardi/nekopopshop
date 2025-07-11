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
    private List<String> orderWhiteList = List.of("quantita", "idOrdine", "idProdotto", "idVolume");

    public AcquistatoDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(AcquistatoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "INSERT INTO " + TABLE_NAME + " (quantita, idOrdine, idProdotto, idVolume) VALUES (?,?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, bean.getqAcquistato());
            ps.setInt(2, bean.getIdOrdine());
            if(bean.getIdProdotto() != null)
                ps.setInt(3, bean.getIdProdotto());
            else
                ps.setNull(3, Types.INTEGER);
            if(bean.getIdVolume() != null)
                ps.setInt(4, bean.getIdVolume());
            else
                ps.setNull(4, Types.INTEGER);

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
                ac = new AcquistatoBean(
                        rs.getInt("idAcquistato"),
                        rs.getInt("quantita"),
                        rs.getInt("idOrdine"),
                        rs.getInt("idProdotto"),
                        rs.getInt("idVolume")
                );
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

        String selectAllSQL = " SELECT * FROM " + TABLE_NAME + " ORDER BY ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idAcquistato");

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                AcquistatoBean ac = new AcquistatoBean(
                        rs.getInt("idAcquistato"),
                        rs.getInt("quantita"),
                        rs.getInt("idOrdine"),
                        rs.getInt("idProdotto"),
                        rs.getInt("idVolume")
                );
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

    public Collection<AcquistatoBean> doRetrieveAllByOrder(int id, String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<AcquistatoBean> acList = new LinkedList<>();

        // Valore di default per l'ordinamento
        String orderColumn = "idAcquistato";

        if (order != null && orderWhiteList.contains(order.strip())) {
            orderColumn = order.strip();
        }

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idOrdine = ? ORDER BY " + orderColumn;

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AcquistatoBean ac = new AcquistatoBean(
                        rs.getInt("idAcquistato"),
                        rs.getInt("quantita"),
                        rs.getInt("idOrdine"),
                        rs.getInt("idProdotto"),
                        rs.getInt("idVolume")
                );
                acList.add(ac);
            }
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
        return acList;
    }


    @Override
    public Collection<AcquistatoBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<AcquistatoBean> acList = new LinkedList<AcquistatoBean>();

        String selectAllSQL = " SELECT * FROM " + TABLE_NAME + " ORDER BY ? LIMIT ? OFFSET ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idAcquistato");

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
            while(rs.next()) {
                AcquistatoBean ac = new AcquistatoBean(rs.getInt("idAcquistato"),
                        rs.getInt("quantita"),
                        rs.getInt("idOrdine"),
                        rs.getInt("idProdotto"),
                        rs.getInt("idVolume")
                );
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

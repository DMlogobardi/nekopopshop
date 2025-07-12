package model.DAO;

import model.Bean.OrdineBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class OrdineDAO implements GenralDAO<OrdineBean>{
    private static final String TABLE_NAME = "ordine";
    private DataSource ds = null;
    private List<String> ordineWhiteList = List.of("idOrdine", "tot", "dataOrdine", "dataArrivoS", "idCliente", "idIndirizzo", "idMetodoPag");

    public OrdineDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(OrdineBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "insert into " + TABLE_NAME + "(tot, dataOrdine, dataArrivoS, idCliente, idIndirizzo, idMetodoPag)" + " values(?,?,?,?,?,?)";

        try{
          con = ds.getConnection();
          ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
          ps.setDouble(1, bean.getTot());
          ps.setString(2, bean.getDataOrdineFormatted().toString());
          ps.setString(3, bean.getDataArrivoFormatted().toString());
          ps.setInt(4, bean.getIdCliente());
          ps.setInt(5, bean.getIdIndirizzo());
          ps.setInt(6, bean.getIdMetodoPag());

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

        String deleteSQL = "delete from " + TABLE_NAME + " where idOrdine = ?";

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
    public OrdineBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        OrdineBean ordine = null;

        String selectSQL = "select * from " + TABLE_NAME + " where idOrdine = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ordine = new OrdineBean(
                        rs.getInt("idOrdine"),
                        rs.getDouble("tot"),
                        rs.getString("dataOrdine"),
                        rs.getString("dataArrivoS"),
                        rs.getInt("idCliente"),
                        rs.getInt("idIndirizzo"),
                        rs.getInt("idMetodoPag")
                );
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return ordine;
    }

    public Collection<OrdineBean> doRetrieveByUser(String order, int code, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<OrdineBean> ordini = new LinkedList<>();

        // Validazione nome colonna per l'ORDER BY
        String orderBy = "idOrdine";
        if (order != null && ordineWhiteList.contains(order.strip())) {
            orderBy = order.strip();
        }

        // Query con ORDER BY costruito in modo sicuro
        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idCliente = ? ORDER BY " + orderBy + " LIMIT ? OFFSET ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            // Impostazione dei parametri
            ps.setInt(1, code);

            int actualLimit = (limit > 0) ? limit : 10;
            int actualOffset = (page > 0) ? (page - 1) * actualLimit : 0;

            ps.setInt(2, actualLimit);
            ps.setInt(3, actualOffset);

            // Esecuzione query e costruzione risultato
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrdineBean ordine = new OrdineBean(
                        rs.getInt("idOrdine"),
                        rs.getDouble("tot"),
                        rs.getString("dataOrdine"),
                        rs.getString("dataArrivoS"),
                        rs.getInt("idCliente"),
                        rs.getInt("idIndirizzo"),
                        rs.getInt("idMetodoPag")
                );
                ordini.add(ordine);
            }
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }

        return ordini;
    }


    @Override
    public Collection<OrdineBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<OrdineBean> ordini = new LinkedList<>();

        // Ordine sicuro: se non valido o nullo, default = idOrdine
        String orderBy = "idOrdine";
        if (order != null && ordineWhiteList.contains(order.strip())) {
            orderBy = order.strip();
        }

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY " + orderBy;

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrdineBean ordine = new OrdineBean(
                        rs.getInt("idOrdine"),
                        rs.getDouble("tot"),
                        rs.getString("dataOrdine"),
                        rs.getString("dataArrivoS"),
                        rs.getInt("idCliente"),
                        rs.getInt("idIndirizzo"),
                        rs.getInt("idMetodoPag")
                );
                ordini.add(ordine);
            }
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }

        return ordini;
    }


    public Collection<OrdineBean> doRetrieveAllByDateRange(String order, Date start, Date end, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<OrdineBean> ordini = new LinkedList<>();

        if (start == null || end == null || start.after(end)) {
            return null;
        }

        // Controllo ordine: di default ordina per idOrdine
        String orderBy = "idOrdine";
        if (order != null && ordineWhiteList.contains(order.strip())) {
            orderBy = order.strip();
        }

        // Costruzione dinamica della query
        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE dataOrdine BETWEEN ? AND ? " +
                "ORDER BY " + orderBy + " LIMIT ? OFFSET ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setDate(1, start);
            ps.setDate(2, end);

            // Calcolo limite e offset
            int actualLimit = (limit > 0) ? limit : 10;
            int actualOffset = (page > 0) ? (page - 1) * actualLimit : 0;

            ps.setInt(3, actualLimit);
            ps.setInt(4, actualOffset);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrdineBean ordine = new OrdineBean(
                        rs.getInt("idOrdine"),
                        rs.getDouble("tot"),
                        rs.getString("dataOrdine"),
                        rs.getString("dataArrivoS"),
                        rs.getInt("idCliente"),
                        rs.getInt("idIndirizzo"),
                        rs.getInt("idMetodoPag")
                );
                ordini.add(ordine);
            }
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }

        return ordini;
    }


    @Override
    public Collection<OrdineBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<OrdineBean> ordini = new LinkedList<>();

        // Controllo ordine: default su "idOrdine"
        String orderBy = "idOrdine";
        if (order != null && ordineWhiteList.contains(order.strip())) {
            orderBy = order.strip();
        }

        // Query costruita dinamicamente per inserire il nome colonna in modo sicuro
        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY " + orderBy + " LIMIT ? OFFSET ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            int actualLimit = (limit > 0) ? limit : 10;
            int actualOffset = (page > 0) ? (page - 1) * actualLimit : 0;

            ps.setInt(1, actualLimit);
            ps.setInt(2, actualOffset);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrdineBean ordine = new OrdineBean(
                        rs.getInt("idOrdine"),
                        rs.getDouble("tot"),
                        rs.getString("dataOrdine"),
                        rs.getString("dataArrivoS"),
                        rs.getInt("idCliente"),
                        rs.getInt("idIndirizzo"),
                        rs.getInt("idMetodoPag")
                );
                ordini.add(ordine);
            }
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }

        return ordini;
    }

    public Collection<OrdineBean> doRetrieveAllLimitByUtent(String order, int limit, int page, int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<OrdineBean> ordini = new LinkedList<>();

        // Controllo ordine: default su "idOrdine"
        String orderBy = "idOrdine";
        if (order != null && ordineWhiteList.contains(order.strip())) {
            orderBy = order.strip();
        }

        // Query costruita dinamicamente per inserire il nome colonna in modo sicuro
        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " where idCliente = ? ORDER BY " + orderBy + " LIMIT ? OFFSET ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);

            int actualLimit = (limit > 0) ? limit : 10;
            int actualOffset = (page > 0) ? (page - 1) * actualLimit : 0;

            ps.setInt(1, code);
            ps.setInt(2, actualLimit);
            ps.setInt(3, actualOffset);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrdineBean ordine = new OrdineBean(
                        rs.getInt("idOrdine"),
                        rs.getDouble("tot"),
                        rs.getString("dataOrdine"),
                        rs.getString("dataArrivoS"),
                        rs.getInt("idCliente"),
                        rs.getInt("idIndirizzo"),
                        rs.getInt("idMetodoPag")
                );
                ordini.add(ordine);
            }
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }

        return ordini;
    }

}

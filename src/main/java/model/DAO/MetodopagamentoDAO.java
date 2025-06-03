package model.DAO;

import model.Bean.MetodoPagamentoBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;

public class MetodopagamentoDAO implements GenralDAO<MetodoPagamentoBean>{
    private static final String TABLE_NAME = "metodopagamento";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idMetodoPag", "nCarta", "tipo", "dataScadenza", "nomeInte", "cognomeInt", "idCliente");

    public MetodopagamentoDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(MetodoPagamentoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "insert into" + TABLE_NAME + "(nCarte, tipo, dataScadenza, nomeInte, cognomeInt, idCliente) values (?,?,?,?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, bean.getnCarta());
            ps.setString(2, bean.getTipo());
            ps.setString(3, bean.getDataScadenzaFormatted().toString());
            ps.setString(4, bean.getNomeInte());
            ps.setInt(5, bean.getIdCliente());

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

        String deleteSQL = "delete from " + TABLE_NAME + " where idMetodoPag = ?";

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
    public MetodoPagamentoBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        MetodoPagamentoBean mPag = null;

        String selectSQL = "select * from " + TABLE_NAME + " where idMetodoPag = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                mPag = new MetodoPagamentoBean(
                        rs.getInt("idMetodoPag"),
                        rs.getString("nCarta"),
                        rs.getString("tipo"),
                        rs.getString("dataScadenza"),
                        rs.getString("nomeInte"),
                        rs.getString("cognomeInt"),
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
        return mPag;
    }

    @Override
    public Collection<MetodoPagamentoBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<MetodoPagamentoBean> mpagList = new LinkedHashSet<MetodoPagamentoBean>();

        String selectAllSQL = "select * from " + TABLE_NAME + " order by ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idMetodoPag");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MetodoPagamentoBean mPag = new MetodoPagamentoBean(
                        rs.getInt("idMetodoPag"),
                        rs.getString("nCarta"),
                        rs.getString("tipo"),
                        rs.getString("dataScadenza"),
                        rs.getString("nomeInte"),
                        rs.getString("cognomeInt"),
                        rs.getInt("idCliente")
                );
                mpagList.add(mPag);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return mpagList;
    }

    @Override
    public Collection<MetodoPagamentoBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<MetodoPagamentoBean> mpagList = new LinkedHashSet<MetodoPagamentoBean>();

        String selectAllSQL = "select * from " + TABLE_NAME + " order by ? limit ? offset ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idMetodoPag");

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
                MetodoPagamentoBean mPag = new MetodoPagamentoBean(
                        rs.getInt("idMetodoPag"),
                        rs.getString("nCarta"),
                        rs.getString("tipo"),
                        rs.getString("dataScadenza"),
                        rs.getString("nomeInte"),
                        rs.getString("cognomeInt"),
                        rs.getInt("idCliente")
                );
                mpagList.add(mPag);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return mpagList;
    }
}

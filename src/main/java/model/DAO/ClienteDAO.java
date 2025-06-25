package model.DAO;

import model.Bean.ClienteBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class ClienteDAO implements GenralDAO<ClienteBean>{
    private static final String TABLE_NAME = "cliente";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idCliente", "nome", "cognome", "dataNascita", "email", "cF");

    public ClienteDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(ClienteBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "insert into " + TABLE_NAME + "(nome, cognome, dataNascita, email, cF)" + " values (?, ?, ?, ?, ?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, bean.getNome());
            ps.setString(2, bean.getCognome());
            ps.setString(3, bean.getDataNascitaFormatted().toString());
            ps.setString(4, bean.getEmail());
            ps.setString(5, bean.getcF());

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

        String deleteSQL = "delete from " + TABLE_NAME + " where idCliente = ?";

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
    public ClienteBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ClienteBean cliente = null;

        String selectSQL = "select * from " + TABLE_NAME + " where idCliente = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cliente = new ClienteBean(
                        rs.getInt("idCliente"),
                        rs.getString("nome"),
                        rs.getString("cognome"),
                        rs.getString("dataNascita"),
                        rs.getString("email"),
                        rs.getString("cF")
                );
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return cliente;
    }

    @Override
    public Collection<ClienteBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ClienteBean> clienti = new LinkedList<ClienteBean>();

        String selectAllSQL = "select * from " + TABLE_NAME + " order by ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idCliente");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ClienteBean cliente = new ClienteBean(
                        rs.getInt("idCliente"),
                        rs.getString("nome"),
                        rs.getString("cognome"),
                        rs.getString("dataNascita"),
                        rs.getString("email"),
                        rs.getString("cF")
                );
                clienti.add(cliente);
            }
        }  finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return clienti;
    }

    @Override
    public Collection<ClienteBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<ClienteBean> clienti = new LinkedList<ClienteBean>();

        String selectAllSQL = "select * from " + TABLE_NAME + " order by ? limit ? offset ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if(order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idCliente");

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
                ClienteBean cliente = new ClienteBean(
                        rs.getInt("idCliente"),
                        rs.getString("nome"),
                        rs.getString("cognome"),
                        rs.getString("dataNascita"),
                        rs.getString("email"),
                        rs.getString("cF")
                );
                clienti.add(cliente);
            }
        }  finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return clienti;
    }
}

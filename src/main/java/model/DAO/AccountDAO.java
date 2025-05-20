package model.DAO;

import model.Bean.AccountBean;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class AccountDAO implements GenralDAO<AccountBean>{
    private static final String TABLE_NAME = "account";
    private DataSource ds = null;
    private List<String> orderWhitelist = List.of("idAccount", "nickName");

    public AccountDAO(DataSource ds) {
        this.ds = ds;
    }


    @Override
    public int doSave(AccountBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "INSERT INTO " + TABLE_NAME + "(password, nickName, adminFlag, idCliente) VALUES ( ?,?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL);
            ps.setString(1, bean.getPassword());
            ps.setString(2, bean.getNickName());
            ps.setBoolean(3, bean.isAdminFlag());
            ps.setInt(4, bean.getIdCliente());

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

        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE idAccount = ?";
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
    public AccountBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        AccountBean account = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idAccount = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                account = new AccountBean(rs.getInt("idAccount"), rs.getString("password"), rs.getString("nickName"), rs.getInt("idCliente"));
                if(rs.getInt("adminFlag") == 1){
                    account.setAdmin();
                }
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return account;
    }

    public AccountBean doRetrieveByNick(String nick) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        AccountBean account = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE nickName = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setString(1, nick);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                account = new AccountBean(rs.getInt("idAccount"), rs.getString("password"), rs.getString("nickName"), rs.getInt("idCliente"));
                if(rs.getInt("adminFlag") == 1){
                    account.setAdmin();
                }
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return account;
    }

    @Override
    public Collection<AccountBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<AccountBean> accounts = new LinkedList<AccountBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME;
        if(order != null && orderWhitelist.contains(order.strip())){
            selectAllSQL += " ORDER BY " + order.strip();
        }

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountBean account = new AccountBean(rs.getInt("idAccount"), rs.getString("password"), rs.getString("nickName"), rs.getInt("idCliente"));
                if(rs.getInt("adminFlag") == 1){
                    account.setAdmin();
                }
                accounts.add(account);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return accounts;
    }

    @Override
    public Collection<AccountBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<AccountBean> accounts = new LinkedList<AccountBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME;
        if(order != null && orderWhitelist.contains(order.strip())){
            selectAllSQL += " ORDER BY " + order.strip();
        }
        if(limit > 0 && page > 0){
            selectAllSQL += " limit " + limit + " offset " + (page - 1) * limit;
        }
        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountBean account = new AccountBean(rs.getInt("idAccount"), rs.getString("password"), rs.getString("nickName"), rs.getInt("idCliente"));
                if(rs.getInt("adminFlag") == 1){
                    account.setAdmin();
                }
                accounts.add(account);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return accounts;
    }
}

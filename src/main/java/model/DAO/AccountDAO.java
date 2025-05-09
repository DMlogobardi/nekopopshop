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
    public void doSave(AccountBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;

        String insertSQL = "INSERT INTO " + TABLE_NAME + "(password, nickName, adminFlag, idCliente) VALUES ( ?,?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL);
            ps.setString(1, bean.getPassword());
            ps.setString(2, bean.getNickName());
            ps.setBoolean(3, bean.isAdminFlag());
            ps.setInt(4, bean.getIdCliente());

            ps.executeUpdate();
        } finally {
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

    @Override
    public Collection<AccountBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<AccountBean> accounts = new LinkedList<AccountBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME;
        if(order != null && orderWhitelist.contains(order)){
            selectAllSQL += " ORDER BY " + order;
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

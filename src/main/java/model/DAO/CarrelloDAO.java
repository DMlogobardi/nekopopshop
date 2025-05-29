package model.DAO;

import model.Bean.CarrelloBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class CarrelloDAO implements GenralDAO<CarrelloBean>{
    private static final String TABLE_NAME = "carrello";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idCarrello", "tot", "speseSped", "sconti", "idCliente");

    public CarrelloDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(CarrelloBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQl = "insert into " + TABLE_NAME + "(tot, speseSped, sconti, idCliente)" + " values(?,?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQl, Statement.RETURN_GENERATED_KEYS);
            ps.setDouble(1, bean.getTot());
            ps.setDouble(2, bean.getSpeseSped());
            ps.setInt(3, bean.getSconti());
            ps.setInt(4, bean.getIdCliente());

            ps.executeUpdate();
            ResultSet i = ps.getGeneratedKeys();
            i.next();
            id = i.getInt(1);

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

        String deleteSQl = "delete from " + TABLE_NAME + " where idCarrello = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(deleteSQl);
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
    public CarrelloBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        CarrelloBean carl = null;

        String selectSQL = "select * from " + TABLE_NAME + " where idCarrello = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                carl = new CarrelloBean(rs.getInt("idCarrello"), rs.getDouble("tot"), rs.getDouble("speseSped"), rs.getInt("sconti"), rs.getInt("idCliente"));
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return carl;
    }

    public CarrelloBean doRetrieveByAccount(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        CarrelloBean carl = null;

        String selectSQL = "select * from " + TABLE_NAME + " where idCliente = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                carl = new CarrelloBean(rs.getInt("idCarrello"), rs.getDouble("tot"), rs.getDouble("speseSped"), rs.getInt("sconti"), rs.getInt("idCliente"));
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return carl;
    }

    @Override
    public Collection<CarrelloBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<CarrelloBean> carelli = new LinkedList<CarrelloBean>();

        String selectAllSQL = "select * from " + TABLE_NAME;
        if(order != null && orderWhiteList.contains(order.strip())){
            selectAllSQL += " order by " + order.strip();
        }
        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                CarrelloBean carl = new CarrelloBean(rs.getInt("idCarrello"), rs.getDouble("tot"), rs.getDouble("speseSped"), rs.getInt("sconti"), rs.getInt("idCliente"));
                carelli.add(carl);
            }
        }  finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return carelli;
    }

    @Override
    public Collection<CarrelloBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<CarrelloBean> carelli = new LinkedList<CarrelloBean>();

        String selectAllSQL = "select * from " + TABLE_NAME;
        if(order != null && orderWhiteList.contains(order.strip())){
            selectAllSQL += " order by " + order.strip();
        }
        if(limit > 0 && page > 0){
            selectAllSQL += " limit " + limit + " offset " + (page - 1) * limit;
        }
        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                CarrelloBean carl = new CarrelloBean(rs.getInt("idCarrello"), rs.getDouble("tot"), rs.getDouble("speseSped"), rs.getInt("sconti"), rs.getInt("idCliente"));
                carelli.add(carl);
            }
        }  finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return carelli;
    }
}

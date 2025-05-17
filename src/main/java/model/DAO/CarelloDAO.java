package model.DAO;

import model.Bean.CarelloBean;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class CarelloDAO implements GenralDAO<CarelloBean>{
    private static final String TABLE_NAME = "carello";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idCarello", "tot", "speseSped", "sconti", "idCliente");

    public CarelloDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public void doSave(CarelloBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;

        String insertSQl = "insert into " + TABLE_NAME + "(tot, speseSped, sconti, idCliente)" + " values(?,?,?,?)";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQl);
            ps.setDouble(1, bean.getTot());
            ps.setDouble(2, bean.getSpeseSped());
            ps.setDouble(3, bean.getSconti());
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

        String deleteSQl = "delete from " + TABLE_NAME + " where idCarello = ?";

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
    public CarelloBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        CarelloBean carl = null;

        String selectSQL = "select * from " + TABLE_NAME + " where idCarello = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                carl = new CarelloBean(rs.getInt("idCarello"), rs.getDouble("tot"), rs.getDouble("speseSped"), rs.getDouble("sconti"), rs.getInt("idCliente"));
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
    public Collection<CarelloBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<CarelloBean> carelli = new LinkedList<CarelloBean>();

        String selectAllSQL = "select * from " + TABLE_NAME;
        if(order != null && orderWhiteList.contains(order.strip())){
            selectAllSQL += " order by " + order.strip();
        }
        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                CarelloBean carl = new CarelloBean(rs.getInt("idCarello"), rs.getDouble("tot"), rs.getDouble("speseSped"), rs.getDouble("sconti"), rs.getInt("idCliente"));
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
    public Collection<CarelloBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<CarelloBean> carelli = new LinkedList<CarelloBean>();

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
                CarelloBean carl = new CarelloBean(rs.getInt("idCarello"), rs.getDouble("tot"), rs.getDouble("speseSped"), rs.getDouble("sconti"), rs.getInt("idCliente"));
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

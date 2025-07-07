package model.DAO;

import model.Bean.ProdottoBean;
import model.Bean.VolumeBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class VolumeDAO implements GenralDAO<VolumeBean> {
    private static final String TABLE_NAME = "volume";
    private DataSource ds = null;
    private List<String> orderWhiteList = List.of("idVolume", "numVolumi", "prezzo", "Quantità", "dataPubl", "tag","idProdotto");

    public VolumeDAO(DataSource ds) {
        this.ds = ds;
    }

    @Override
    public int doSave(VolumeBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int id = 0;

        String insertSQL = "INSERT INTO " + TABLE_NAME + "(numVolumi, prezzo, Quantità, dataPubl, imgVol, tag, idProdotto)" + " VALUES (?,?,?,?,?,?,?)";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, bean.getNumVolumi());
            ps.setDouble(2, bean.getPrezzo());
            ps.setInt(3, bean.getQuantita());
            ps.setString(4, bean.getDataPublFormatted().toString());
            ps.setBytes(5, bean.getImgVol());
            ps.setString(6, bean.getTag());
            ps.setInt(7, bean.getIdProdotto());

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

        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE idVolume = ?";

        try {
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
        return (result != 0);
    }

    @Override
    public VolumeBean doRetrieveByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        VolumeBean volume = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idVolume = ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                volume = new VolumeBean(
                        rs.getInt("idVolume"),
                        rs.getInt("numVolumi"),
                        rs.getDouble("prezzo"),
                        rs.getInt("quantità"),
                        rs.getString("dataPubl"),
                        rs.getBytes("imgVol"),
                        rs.getString("tag"),
                        rs.getInt("idProdotto")
                );
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return volume;
    }

    public int doRetrieveTot() throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;

        int result = 0;

        String selectSQL = "SELECT COUNT(*) FROM " + TABLE_NAME;

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result = rs.getInt("COUNT(*)");
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

    public int doRetrieveQuantity(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String selectSQL = "SELECT quantita FROM " + TABLE_NAME + " WHERE idVolume = ?";

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

    public VolumeBean doRetrieveByProduct(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        VolumeBean volume = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idProdotto = ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                volume = new VolumeBean(
                        rs.getInt("idVolume"),
                        rs.getInt("numVolumi"),
                        rs.getDouble("prezzo"),
                        rs.getInt("quantità"),
                        rs.getString("dataPubl"),
                        rs.getBytes("imgVol"),
                        rs.getString("tag"),
                        rs.getInt("idProdotto")
                );
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return volume;
    }

    @Override
    public Collection<VolumeBean> doRetrieveAll(String order) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<VolumeBean> volumes = new LinkedList<VolumeBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if (order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idVolume");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                VolumeBean volume = new VolumeBean(
                        rs.getInt("idVolume"),
                        rs.getInt("numVolumi"),
                        rs.getDouble("prezzo"),
                        rs.getInt("quantità"),
                        rs.getString("dataPubl"),
                        rs.getBytes("imgVol"),
                        rs.getString("tag"),
                        rs.getInt("idProdotto")
                );
                volumes.add(volume);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return volumes;
    }

    @Override
    public Collection<VolumeBean> doRetrieveAllLimit(String order, int limit, int page) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<VolumeBean> volumes = new LinkedList<VolumeBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY ? limit ? offset ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            if (order != null && orderWhiteList.contains(order.strip()))
                ps.setString(1, order.strip());
            else
                ps.setString(1, "idVolume");

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
                VolumeBean volume = new VolumeBean(
                        rs.getInt("idVolume"),
                        rs.getInt("numVolumi"),
                        rs.getDouble("prezzo"),
                        rs.getInt("quantità"),
                        rs.getString("dataPubl"),
                        rs.getBytes("imgVol"),
                        rs.getString("tag"),
                        rs.getInt("idProdotto")
                );
                volumes.add(volume);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        System.out.println(volumes);
        return volumes;
    }

    public Collection<VolumeBean> doRetrieveAllLimitByType(String order, int limit, int page, String type) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<VolumeBean> volumes = new LinkedList<VolumeBean>();

        String selectAllSQL = "SELECT * FROM " + TABLE_NAME + " where tag = ? ORDER BY ? limit ? offset ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ps.setString(1, type);
            if (order != null && orderWhiteList.contains(order.strip()))
                ps.setString(2, order.strip());
            else
                ps.setString(2, "idVolume");

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
            while (rs.next()) {
                VolumeBean volume = new VolumeBean(
                        rs.getInt("idVolume"),
                        rs.getInt("numVolumi"),
                        rs.getDouble("prezzo"),
                        rs.getInt("quantità"),
                        rs.getString("dataPubl"),
                        rs.getBytes("imgVol"),
                        rs.getString("tag"),
                        rs.getInt("idProdotto")
                );
                volumes.add(volume);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        System.out.println(volumes);
        return volumes;
    }

    public Collection<VolumeBean> doRetrieveAllLimitByType(String order, int limit, int page, String serch, String type) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<VolumeBean> volumes = new LinkedList<VolumeBean>();

        String selectAllSQL =
                "SELECT * FROM " + TABLE_NAME + " " +
                        "JOIN prodotto ON prodotto.idProdotto = volume.idProdotto " +
                        "WHERE volume.idProdotto = prodotto.idProdotto and where tag = ?";

        if (serch != null && !serch.isEmpty()) {
            selectAllSQL += "AND LOWER(CONCAT(prodotto.nome, CAST(volume.numVolumi AS CHAR))) LIKE ? ";
        }
        selectAllSQL += " ORDER BY ? limit ? offset ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ps.setString(1, type);
            ps.setString(2,  "%" + serch.toLowerCase() + "%");
            if (order != null && orderWhiteList.contains(order.strip()))
                ps.setString(3, order.strip());
            else
                ps.setString(3, "idVolume");

            if (limit > 0 && page > 0) {
                ps.setInt(4, limit);
                ps.setInt(5, (page - 1) * limit);
            } else if (page > 0 && limit <= 0) {
                ps.setInt(4, 10);
                ps.setInt(5, (page - 1) * limit);
            } else if (limit > 0 && page <= 0) {
                ps.setInt(4, limit);
                ps.setInt(5, 0);
            } else {
                ps.setInt(4, 10);
                ps.setInt(5, 0);
            }


            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                VolumeBean volume = new VolumeBean(
                        rs.getInt("idVolume"),
                        rs.getInt("numVolumi"),
                        rs.getDouble("prezzo"),
                        rs.getInt("quantità"),
                        rs.getString("dataPubl"),
                        rs.getBytes("imgVol"),
                        rs.getString("tag"),
                        rs.getInt("idProdotto")
                );
                volumes.add(volume);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }

        return volumes;
    }

    public Collection<VolumeBean> doRetrieveAllLimit(String order, int limit, int page, String serch) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<VolumeBean> volumes = new LinkedList<VolumeBean>();

        String selectAllSQL =
                "SELECT * FROM " + TABLE_NAME + " " +
                        "JOIN prodotto ON prodotto.idProdotto = volume.idProdotto " +
                        "WHERE volume.idProdotto = prodotto.idProdotto ";

        if (serch != null && !serch.isEmpty()) {
            selectAllSQL += "AND LOWER(CONCAT(prodotto.nome, CAST(volume.numVolumi AS CHAR))) LIKE ? ";
        }
        selectAllSQL += " ORDER BY ? limit ? offset ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectAllSQL);
            ps.setString(1,  "%" + serch.toLowerCase() + "%");
            if (order != null && orderWhiteList.contains(order.strip()))
                ps.setString(2, order.strip());
            else
                ps.setString(2, "idVolume");

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
            while (rs.next()) {
                VolumeBean volume = new VolumeBean(
                        rs.getInt("idVolume"),
                        rs.getInt("numVolumi"),
                        rs.getDouble("prezzo"),
                        rs.getInt("quantità"),
                        rs.getString("dataPubl"),
                        rs.getBytes("imgVol"),
                        rs.getString("tag"),
                        rs.getInt("idProdotto")
                );
                volumes.add(volume);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }

        return volumes;
    }

    public boolean uppdate(VolumeBean vol) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;
        String updateSQL = "";

        if(vol.getImgVol() != null) {
            updateSQL = "update " + TABLE_NAME + " set numVolumi = ?, prezzo = ?, quantità = ?, dataPubl = ?, imgVol = ?, tag = ?, idProdotto = ? where idProdotto = ? and numVolumi = ?";
        } else {
            updateSQL = "update " + TABLE_NAME + " set numVolumi = ?, prezzo = ?, quantità = ?, dataPubl = ?, tag = ?, idProdotto = ? where idProdotto = ? and numVolumi = ?";
        }
        try {
            con = ds.getConnection();
            ps = con.prepareStatement(updateSQL);
            if(vol.getImgVol() != null) {
                ps.setInt(1, vol.getNumVolumi());
                ps.setDouble(2, vol.getPrezzo());
                ps.setInt(3, vol.getQuantita());
                ps.setDate(4, vol.getDataPublFormatted());
                ps.setBytes(5, vol.getImgVol());
                ps.setString(6, vol.getTag());
                ps.setInt(7, vol.getIdProdotto());
                ps.setInt(8, vol.getIdProdotto());
                ps.setInt(9, vol.getNumVolumi());
            } else {
                ps.setInt(1, vol.getNumVolumi());
                ps.setDouble(2, vol.getPrezzo());
                ps.setInt(3, vol.getQuantita());
                ps.setDate(4, vol.getDataPublFormatted());
                ps.setString(5, vol.getTag());
                ps.setInt(6, vol.getIdProdotto());
                ps.setInt(7, vol.getIdProdotto());
                ps.setInt(8, vol.getNumVolumi());
            }

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

    public boolean decrementQuantita(int quantita, int idVol) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String updateSQL = "update " + TABLE_NAME + " set quantità = quantità - ? where idVolume = ?";

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(updateSQL);
            ps.setInt(1, quantita);
            ps.setInt(2, idVol);

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

    public Collection<VolumeBean> doRetrieveAllByProduct(int idProdotto, String serch) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        Collection<VolumeBean> volumes = new LinkedList<>();

        String selectByProductSQL =
                "SELECT * FROM " + TABLE_NAME + " " +
                        "JOIN prodotto ON prodotto.idProdotto = volume.idProdotto " +
                        "WHERE volume.idProdotto = ? ";

        if (serch != null && !serch.isEmpty()) {
            selectByProductSQL += "AND LOWER(CONCAT(prodotto.nome, CAST(volume.numVolumi AS CHAR))) LIKE ?";
        }

        try {
            con = ds.getConnection();
            ps = con.prepareStatement(selectByProductSQL);
            ps.setInt(1, idProdotto);
            ps.setString(2,  "%" + serch.toLowerCase() + "%");

            if (serch != null && !serch.isEmpty()) {
                ps.setString(2, "%" + serch.toLowerCase() + "%");
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                VolumeBean volume = new VolumeBean(
                        rs.getInt("idVolume"),
                        rs.getInt("numVolumi"),
                        rs.getDouble("prezzo"),
                        rs.getInt("quantità"),
                        rs.getString("dataPubl"),
                        rs.getBytes("imgVol"),
                        rs.getString("tag"),
                        rs.getInt("idProdotto")
                );
                volumes.add(volume);
            }
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (con != null) con.close();
            }
        }
        return volumes;
    }

    public Double doRetrievePrezzoByKey(int code) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        double prezzo = 0;

        String selectSQL = "SELECT prezzo FROM " + TABLE_NAME + " WHERE idVolume = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSQL);
            ps.setInt(1, code);

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
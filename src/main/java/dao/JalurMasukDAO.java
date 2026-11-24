package dao;

import model.JalurMasuk;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JalurMasukDAO {

    public List<JalurMasuk> getAll() throws Exception {
        List<JalurMasuk> list = new ArrayList<>();
        String sql = "SELECT * FROM jalur_masuks";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                JalurMasuk jm = new JalurMasuk();
                jm.setId(rs.getInt("id"));
                jm.setNamaJalur(rs.getString("nama_jalur"));
                list.add(jm);
            }
        }
        return list;
    }

    public JalurMasuk getById(int id) throws Exception {
        JalurMasuk jm = null;
        String sql = "SELECT * FROM jalur_masuks WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    jm = new JalurMasuk();
                    jm.setId(rs.getInt("id"));
                    jm.setNamaJalur(rs.getString("nama_jalur"));
                }
            }
        }
        return jm;
    }

    public void insert(JalurMasuk jm) throws Exception {
        String sql = "INSERT INTO jalur_masuks (nama_jalur) VALUES (?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, jm.getNamaJalur());
            ps.executeUpdate();
        }
    }

    public void update(JalurMasuk jm) throws Exception {
        String sql = "UPDATE jalur_masuks SET nama_jalur = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, jm.getNamaJalur());
            ps.setInt(2, jm.getId());
            ps.executeUpdate();
        }
    }

    public void delete(int id) throws Exception {
        String sql = "DELETE FROM jalur_masuks WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
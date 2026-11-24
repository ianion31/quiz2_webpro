package dao;

import model.Mahasiswa;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MahasiswaDAO {

    public List<Mahasiswa> getAll() throws Exception {
        List<Mahasiswa> list = new ArrayList<>();
        String sql = "SELECT * FROM mahasiswas";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Mahasiswa m = new Mahasiswa();
                m.setId(rs.getInt("id"));
                m.setNama(rs.getString("nama"));
                m.setNrp(rs.getString("nrp"));
                m.setAngkatan(rs.getString("angkatan"));
                m.setJalurMasukId(rs.getInt("jalur_masuk_id"));
                list.add(m);
            }
        }
        return list;
    }

    public Mahasiswa getById(int id) throws Exception {
        Mahasiswa m = null;
        String sql = "SELECT * FROM mahasiswas WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    m = new Mahasiswa();
                    m.setId(rs.getInt("id"));
                    m.setNama(rs.getString("nama"));
                    m.setNrp(rs.getString("nrp"));
                    m.setAngkatan(rs.getString("angkatan"));
                    m.setJalurMasukId(rs.getInt("jalur_masuk_id"));
                }
            }
        }
        return m;
    }

    public void insert(Mahasiswa m) throws Exception {
        String sql = "INSERT INTO mahasiswas (nama, nrp, angkatan, jalur_masuk_id) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, m.getNama());
            ps.setString(2, m.getNrp());
            ps.setString(3, m.getAngkatan());
            ps.setInt(4, m.getJalurMasukId());
            ps.executeUpdate();
        }
    }

    public void update(Mahasiswa m) throws Exception {
        String sql = "UPDATE mahasiswas SET nama = ?, nrp = ?, angkatan = ?, jalur_masuk_id = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, m.getNama());
            ps.setString(2, m.getNrp());
            ps.setString(3, m.getAngkatan());
            ps.setInt(4, m.getJalurMasukId());
            ps.setInt(5, m.getId());
            ps.executeUpdate();
        }
    }

    public void delete(int id) throws Exception {
        String sql = "DELETE FROM mahasiswas WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
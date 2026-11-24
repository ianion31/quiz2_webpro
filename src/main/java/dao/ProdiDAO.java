package dao;

import model.Prodi;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProdiDAO {

    public List<Prodi> getAll() throws Exception {
        List<Prodi> list = new ArrayList<>();
        String sql = "SELECT * FROM prodis";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Prodi p = new Prodi();
                p.setId(rs.getInt("id"));
                p.setKodeProdi(rs.getString("kode_prodi"));
                p.setNamaProdi(rs.getString("nama_prodi"));
                p.setJenjang(rs.getString("jenjang"));
                p.setKuota(rs.getInt("kuota"));
                list.add(p);
            }
        }
        return list;
    }

    public Prodi getById(int id) throws Exception {
        Prodi p = null;
        String sql = "SELECT * FROM prodis WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Prodi();
                    p.setId(rs.getInt("id"));
                    p.setKodeProdi(rs.getString("kode_prodi"));
                    p.setNamaProdi(rs.getString("nama_prodi"));
                    p.setJenjang(rs.getString("jenjang"));
                    p.setKuota(rs.getInt("kuota"));
                }
            }
        }
        return p;
    }

    public void insert(Prodi p) throws Exception {
        String sql = "INSERT INTO prodis (kode_prodi, nama_prodi, jenjang, kuota) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getKodeProdi());
            ps.setString(2, p.getNamaProdi());
            ps.setString(3, p.getJenjang());
            ps.setInt(4, p.getKuota());
            ps.executeUpdate();
        }
    }

    public void update(Prodi p) throws Exception {
        String sql = "UPDATE prodis SET kode_prodi = ?, nama_prodi = ?, jenjang = ?, kuota = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getKodeProdi());
            ps.setString(2, p.getNamaProdi());
            ps.setString(3, p.getJenjang());
            ps.setInt(4, p.getKuota());
            ps.setInt(5, p.getId());
            ps.executeUpdate();
        }
    }

    public void delete(int id) throws Exception {
        String sql = "DELETE FROM prodis WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
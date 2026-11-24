package dao;

import model.Pembayaran;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PembayaranDAO {

    public List<Pembayaran> getAll() throws Exception {
        List<Pembayaran> list = new ArrayList<>();
        String sql = "SELECT * FROM pembayarans";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Pembayaran p = new Pembayaran();
                p.setId(rs.getInt("id"));
                p.setMahasiswaId(rs.getInt("mahasiswa_id"));
                p.setKodePembayaran(rs.getString("kode_pembayaran"));
                p.setNominal(rs.getDouble("nominal"));
                p.setMetodeBayar(rs.getString("metode_bayar"));
                p.setStatusBayar(rs.getString("status_bayar"));
                p.setTanggalBayar(rs.getDate("tanggal_bayar"));
                list.add(p);
            }
        }
        return list;
    }

    public Pembayaran getById(int id) throws Exception {
        Pembayaran p = null;
        String sql = "SELECT * FROM pembayarans WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Pembayaran();
                    p.setId(rs.getInt("id"));
                    p.setMahasiswaId(rs.getInt("mahasiswa_id"));
                    p.setKodePembayaran(rs.getString("kode_pembayaran"));
                    p.setNominal(rs.getDouble("nominal"));
                    p.setMetodeBayar(rs.getString("metode_bayar"));
                    p.setStatusBayar(rs.getString("status_bayar"));
                    p.setTanggalBayar(rs.getDate("tanggal_bayar"));
                }
            }
        }
        return p;
    }

    public void insert(Pembayaran p) throws Exception {
        String sql = "INSERT INTO pembayarans (mahasiswa_id, kode_pembayaran, nominal, metode_bayar, status_bayar, tanggal_bayar) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, p.getMahasiswaId());
            ps.setString(2, p.getKodePembayaran());
            ps.setDouble(3, p.getNominal());
            ps.setString(4, p.getMetodeBayar());
            ps.setString(5, p.getStatusBayar());
            ps.setDate(6, p.getTanggalBayar());
            ps.executeUpdate();
        }
    }

    public void update(Pembayaran p) throws Exception {
        String sql = "UPDATE pembayarans SET mahasiswa_id = ?, kode_pembayaran = ?, nominal = ?, metode_bayar = ?, status_bayar = ?, tanggal_bayar = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, p.getMahasiswaId());
            ps.setString(2, p.getKodePembayaran());
            ps.setDouble(3, p.getNominal());
            ps.setString(4, p.getMetodeBayar());
            ps.setString(5, p.getStatusBayar());
            ps.setDate(6, p.getTanggalBayar());
            ps.setInt(7, p.getId());
            ps.executeUpdate();
        }
    }

    public void delete(int id) throws Exception {
        String sql = "DELETE FROM pembayarans WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
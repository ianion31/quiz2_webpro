package dao;

import model.Pengumuman;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PengumumanDAO {

    public List<Pengumuman> getAll() throws Exception {
        List<Pengumuman> list = new ArrayList<>();
        String sql = "SELECT * FROM pengumumans";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Pengumuman pg = new Pengumuman();
                pg.setId(rs.getInt("id"));
                pg.setJudul(rs.getString("judul"));
                pg.setIsi(rs.getString("isi"));
                pg.setTanggalPublish(rs.getDate("tanggal_publish"));
                pg.setStatusAktif(rs.getInt("status_aktif"));
                list.add(pg);
            }
        }
        return list;
    }

    public Pengumuman getById(int id) throws Exception {
        Pengumuman pg = null;
        String sql = "SELECT * FROM pengumumans WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    pg = new Pengumuman();
                    pg.setId(rs.getInt("id"));
                    pg.setJudul(rs.getString("judul"));
                    pg.setIsi(rs.getString("isi"));
                    pg.setTanggalPublish(rs.getDate("tanggal_publish"));
                    pg.setStatusAktif(rs.getInt("status_aktif"));
                }
            }
        }
        return pg;
    }

    public void insert(Pengumuman pg) throws Exception {
        String sql = "INSERT INTO pengumumans (judul, isi, tanggal_publish, status_aktif) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, pg.getJudul());
            ps.setString(2, pg.getIsi());
            ps.setDate(3, pg.getTanggalPublish());
            ps.setInt(4, pg.getStatusAktif());
            ps.executeUpdate();
        }
    }

    public void update(Pengumuman pg) throws Exception {
        String sql = "UPDATE pengumumans SET judul = ?, isi = ?, tanggal_publish = ?, status_aktif = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, pg.getJudul());
            ps.setString(2, pg.getIsi());
            ps.setDate(3, pg.getTanggalPublish());
            ps.setInt(4, pg.getStatusAktif());
            ps.setInt(5, pg.getId());
            ps.executeUpdate();
        }
    }

    public void delete(int id) throws Exception {
        String sql = "DELETE FROM pengumumans WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
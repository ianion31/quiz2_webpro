package dao;

import model.JadwalSeleksi;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JadwalSeleksiDAO {

    public List<JadwalSeleksi> getAll() throws Exception {
        List<JadwalSeleksi> list = new ArrayList<>();
        String sql = "SELECT * FROM jadwal_seleksis";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                JadwalSeleksi js = new JadwalSeleksi();
                js.setId(rs.getInt("id"));
                js.setJalurMasukId(rs.getInt("jalur_masuk_id"));
                js.setNamaKegiatan(rs.getString("nama_kegiatan"));
                js.setTanggalMulai(rs.getDate("tanggal_mulai"));
                js.setTanggalSelesai(rs.getDate("tanggal_selesai"));
                js.setLokasi(rs.getString("lokasi"));
                list.add(js);
            }
        }
        return list;
    }

    public JadwalSeleksi getById(int id) throws Exception {
        JadwalSeleksi js = null;
        String sql = "SELECT * FROM jadwal_seleksis WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    js = new JadwalSeleksi();
                    js.setId(rs.getInt("id"));
                    js.setJalurMasukId(rs.getInt("jalur_masuk_id"));
                    js.setNamaKegiatan(rs.getString("nama_kegiatan"));
                    js.setTanggalMulai(rs.getDate("tanggal_mulai"));
                    js.setTanggalSelesai(rs.getDate("tanggal_selesai"));
                    js.setLokasi(rs.getString("lokasi"));
                }
            }
        }
        return js;
    }

    public void insert(JadwalSeleksi js) throws Exception {
        String sql = "INSERT INTO jadwal_seleksis (jalur_masuk_id, nama_kegiatan, tanggal_mulai, tanggal_selesai, lokasi) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, js.getJalurMasukId());
            ps.setString(2, js.getNamaKegiatan());
            ps.setDate(3, js.getTanggalMulai());
            ps.setDate(4, js.getTanggalSelesai());
            ps.setString(5, js.getLokasi());
            ps.executeUpdate();
        }
    }

    public void update(JadwalSeleksi js) throws Exception {
        String sql = "UPDATE jadwal_seleksis SET jalur_masuk_id = ?, nama_kegiatan = ?, tanggal_mulai = ?, tanggal_selesai = ?, lokasi = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, js.getJalurMasukId());
            ps.setString(2, js.getNamaKegiatan());
            ps.setDate(3, js.getTanggalMulai());
            ps.setDate(4, js.getTanggalSelesai());
            ps.setString(5, js.getLokasi());
            ps.setInt(6, js.getId());
            ps.executeUpdate();
        }
    }

    public void delete(int id) throws Exception {
        String sql = "DELETE FROM jadwal_seleksis WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
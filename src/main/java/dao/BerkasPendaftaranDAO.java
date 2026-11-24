package dao;

import model.BerkasPendaftaran;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BerkasPendaftaranDAO {

    public List<BerkasPendaftaran> getAll() throws Exception {
        List<BerkasPendaftaran> list = new ArrayList<>();
        String sql = "SELECT * FROM berkas_pendaftarans";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                BerkasPendaftaran bp = new BerkasPendaftaran();
                bp.setId(rs.getInt("id"));
                bp.setMahasiswaId(rs.getInt("mahasiswa_id"));
                bp.setJenisBerkas(rs.getString("jenis_berkas"));
                bp.setFilePath(rs.getString("file_path"));
                bp.setStatusVerifikasi(rs.getString("status_verifikasi"));
                bp.setCatatan(rs.getString("catatan"));
                list.add(bp);
            }
        }
        return list;
    }

    public BerkasPendaftaran getById(int id) throws Exception {
        BerkasPendaftaran bp = null;
        String sql = "SELECT * FROM berkas_pendaftarans WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    bp = new BerkasPendaftaran();
                    bp.setId(rs.getInt("id"));
                    bp.setMahasiswaId(rs.getInt("mahasiswa_id"));
                    bp.setJenisBerkas(rs.getString("jenis_berkas"));
                    bp.setFilePath(rs.getString("file_path"));
                    bp.setStatusVerifikasi(rs.getString("status_verifikasi"));
                    bp.setCatatan(rs.getString("catatan"));
                }
            }
        }
        return bp;
    }

    public void insert(BerkasPendaftaran bp) throws Exception {
        String sql = "INSERT INTO berkas_pendaftarans (mahasiswa_id, jenis_berkas, file_path, status_verifikasi, catatan) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, bp.getMahasiswaId());
            ps.setString(2, bp.getJenisBerkas());
            ps.setString(3, bp.getFilePath());
            ps.setString(4, bp.getStatusVerifikasi());
            ps.setString(5, bp.getCatatan());
            ps.executeUpdate();
        }
    }

    public void update(BerkasPendaftaran bp) throws Exception {
        String sql = "UPDATE berkas_pendaftarans SET mahasiswa_id = ?, jenis_berkas = ?, file_path = ?, status_verifikasi = ?, catatan = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, bp.getMahasiswaId());
            ps.setString(2, bp.getJenisBerkas());
            ps.setString(3, bp.getFilePath());
            ps.setString(4, bp.getStatusVerifikasi());
            ps.setString(5, bp.getCatatan());
            ps.setInt(6, bp.getId());
            ps.executeUpdate();
        }
    }

    public void delete(int id) throws Exception {
        String sql = "DELETE FROM berkas_pendaftarans WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
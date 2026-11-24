package model;

import java.sql.Date;

public class JadwalSeleksi {
    private int id;
    private int jalurMasukId;
    private String namaKegiatan;
    private Date tanggalMulai;
    private Date tanggalSelesai;
    private String lokasi;

    public JadwalSeleksi() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getJalurMasukId() {
        return jalurMasukId;
    }

    public void setJalurMasukId(int jalurMasukId) {
        this.jalurMasukId = jalurMasukId;
    }

    public String getNamaKegiatan() {
        return namaKegiatan;
    }

    public void setNamaKegiatan(String namaKegiatan) {
        this.namaKegiatan = namaKegiatan;
    }

    public Date getTanggalMulai() {
        return tanggalMulai;
    }

    public void setTanggalMulai(Date tanggalMulai) {
        this.tanggalMulai = tanggalMulai;
    }

    public Date getTanggalSelesai() {
        return tanggalSelesai;
    }

    public void setTanggalSelesai(Date tanggalSelesai) {
        this.tanggalSelesai = tanggalSelesai;
    }

    public String getLokasi() {
        return lokasi;
    }

    public void setLokasi(String lokasi) {
        this.lokasi = lokasi;
    }
}
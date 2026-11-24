package model;

import java.sql.Date;

public class Pengumuman {
    private int id;
    private String judul;
    private String isi;
    private Date tanggalPublish;
    private int statusAktif;

    public Pengumuman() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getIsi() {
        return isi;
    }

    public void setIsi(String isi) {
        this.isi = isi;
    }

    public Date getTanggalPublish() {
        return tanggalPublish;
    }

    public void setTanggalPublish(Date tanggalPublish) {
        this.tanggalPublish = tanggalPublish;
    }

    public int getStatusAktif() {
        return statusAktif;
    }

    public void setStatusAktif(int statusAktif) {
        this.statusAktif = statusAktif;
    }
}
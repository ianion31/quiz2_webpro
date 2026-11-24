package model;

import java.sql.Date;

public class Pembayaran {
    private int id;
    private int mahasiswaId;
    private String kodePembayaran;
    private double nominal;
    private String metodeBayar;
    private String statusBayar;
    private Date tanggalBayar;

    public Pembayaran() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMahasiswaId() {
        return mahasiswaId;
    }

    public void setMahasiswaId(int mahasiswaId) {
        this.mahasiswaId = mahasiswaId;
    }

    public String getKodePembayaran() {
        return kodePembayaran;
    }

    public void setKodePembayaran(String kodePembayaran) {
        this.kodePembayaran = kodePembayaran;
    }

    public double getNominal() {
        return nominal;
    }

    public void setNominal(double nominal) {
        this.nominal = nominal;
    }

    public String getMetodeBayar() {
        return metodeBayar;
    }

    public void setMetodeBayar(String metodeBayar) {
        this.metodeBayar = metodeBayar;
    }

    public String getStatusBayar() {
        return statusBayar;
    }

    public void setStatusBayar(String statusBayar) {
        this.statusBayar = statusBayar;
    }

    public Date getTanggalBayar() {
        return tanggalBayar;
    }

    public void setTanggalBayar(Date tanggalBayar) {
        this.tanggalBayar = tanggalBayar;
    }
}
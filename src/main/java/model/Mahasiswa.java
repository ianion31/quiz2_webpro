package model;

public class Mahasiswa {
    private int id;
    private String nama;
    private String nrp;
    private String angkatan;
    private int jalurMasukId;

    public Mahasiswa() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getNrp() {
        return nrp;
    }

    public void setNrp(String nrp) {
        this.nrp = nrp;
    }

    public String getAngkatan() {
        return angkatan;
    }

    public void setAngkatan(String angkatan) {
        this.angkatan = angkatan;
    }

    public int getJalurMasukId() {
        return jalurMasukId;
    }

    public void setJalurMasukId(int jalurMasukId) {
        this.jalurMasukId = jalurMasukId;
    }
}
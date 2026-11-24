package model;

public class Prodi {
    private int id;
    private String kodeProdi;
    private String namaProdi;
    private String jenjang;
    private int kuota;

    public Prodi() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKodeProdi() {
        return kodeProdi;
    }

    public void setKodeProdi(String kodeProdi) {
        this.kodeProdi = kodeProdi;
    }

    public String getNamaProdi() {
        return namaProdi;
    }

    public void setNamaProdi(String namaProdi) {
        this.namaProdi = namaProdi;
    }

    public String getJenjang() {
        return jenjang;
    }

    public void setJenjang(String jenjang) {
        this.jenjang = jenjang;
    }

    public int getKuota() {
        return kuota;
    }

    public void setKuota(int kuota) {
        this.kuota = kuota;
    }
}
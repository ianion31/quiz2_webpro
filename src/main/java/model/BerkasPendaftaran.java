package model;

public class BerkasPendaftaran {
    private int id;
    private int mahasiswaId;
    private String jenisBerkas;
    private String filePath;
    private String statusVerifikasi;
    private String catatan;

    public BerkasPendaftaran() {
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

    public String getJenisBerkas() {
        return jenisBerkas;
    }

    public void setJenisBerkas(String jenisBerkas) {
        this.jenisBerkas = jenisBerkas;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getStatusVerifikasi() {
        return statusVerifikasi;
    }

    public void setStatusVerifikasi(String statusVerifikasi) {
        this.statusVerifikasi = statusVerifikasi;
    }

    public String getCatatan() {
        return catatan;
    }

    public void setCatatan(String catatan) {
        this.catatan = catatan;
    }
}
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Jadwal Seleksi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h3>${jadwal != null ? 'Edit' : 'Tambah'} Jadwal Seleksi</h3>
    <form action="jadwal" method="post" class="card p-4 mt-3">
        <input type="hidden" name="id" value="${jadwal.id}">
        <div class="mb-3">
            <label class="form-label">Jalur Masuk</label>
            <select name="jalur_masuk_id" class="form-select" required>
                <c:forEach var="j" items="${listJalur}">
                    <option value="${j.id}" ${jadwal.jalurMasukId == j.id ? 'selected' : ''}>
                        ${j.namaJalur}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Nama Kegiatan</label>
            <input type="text" name="nama_kegiatan" class="form-control" value="${jadwal.namaKegiatan}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Tanggal Mulai</label>
            <input type="date" name="tanggal_mulai" class="form-control" value="${jadwal.tanggalMulai}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Tanggal Selesai</label>
            <input type="date" name="tanggal_selesai" class="form-control" value="${jadwal.tanggalSelesai}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Lokasi</label>
            <input type="text" name="lokasi" class="form-control" value="${jadwal.lokasi}" required>
        </div>
        <div>
            <button type="submit" class="btn btn-success">Simpan</button>
            <a href="jadwal" class="btn btn-secondary">Batal</a>
        </div>
    </form>
</body>
</html>
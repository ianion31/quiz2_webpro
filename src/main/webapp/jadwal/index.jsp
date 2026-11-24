<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Data Jadwal Seleksi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Data Jadwal Seleksi</h3>
        <div>
            <a href="dashboard.jsp" class="btn btn-secondary">Kembali</a>
            <a href="jadwal?action=new" class="btn btn-primary">+ Tambah Jadwal</a>
        </div>
    </div>
    <table class="table table-bordered table-striped bg-white">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>ID Jalur</th>
                <th>Nama Kegiatan</th>
                <th>Tanggal Mulai</th>
                <th>Tanggal Selesai</th>
                <th>Lokasi</th>
                <th width="160">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="jw" items="${listJadwal}">
                <tr>
                    <td>${jw.id}</td>
                    <td>${jw.jalurMasukId}</td>
                    <td>${jw.namaKegiatan}</td>
                    <td>${jw.tanggalMulai}</td>
                    <td>${jw.tanggalSelesai}</td>
                    <td>${jw.lokasi}</td>
                    <td>
                        <a href="jadwal?action=edit&id=${jw.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="jadwal?action=delete&id=${jw.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Hapus jadwal seleksi ini?')">Hapus</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Data Berkas Pendaftaran</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Data Berkas Pendaftaran</h3>
        <div>
            <a href="dashboard.jsp" class="btn btn-secondary">Kembali</a>
            <a href="berkas?action=new" class="btn btn-primary">+ Tambah Berkas</a>
        </div>
    </div>
    <table class="table table-bordered table-striped bg-white">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>ID Mahasiswa</th>
                <th>Jenis Berkas</th>
                <th>Path File</th>
                <th>Status Verifikasi</th>
                <th>Catatan</th>
                <th width="160">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${listBerkas}">
                <tr>
                    <td>${b.id}</td>
                    <td>${b.mahasiswaId}</td>
                    <td>${b.jenisBerkas}</td>
                    <td>${b.filePath}</td>
                    <td>${b.statusVerifikasi}</td>
                    <td>${b.catatan}</td>
                    <td>
                        <a href="berkas?action=edit&id=${b.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="berkas?action=delete&id=${b.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Hapus berkas ini?')">Hapus</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
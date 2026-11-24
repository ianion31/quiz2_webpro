<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Data Mahasiswa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Data Mahasiswa</h3>
        <div>
            <a href="dashboard.jsp" class="btn btn-secondary">Kembali</a>
            <a href="mahasiswa?action=new" class="btn btn-primary">+ Tambah Mahasiswa</a>
        </div>
    </div>
    <table class="table table-bordered table-striped bg-white">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>NRP</th>
                <th>Nama Lengkap</th>
                <th>Angkatan</th>
                <th>ID Jalur Masuk</th>
                <th width="160">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="m" items="${listMhs}">
                <tr>
                    <td>${m.id}</td>
                    <td>${m.nrp}</td>
                    <td>${m.nama}</td>
                    <td>${m.angkatan}</td>
                    <td>${m.jalurMasukId}</td>
                    <td>
                        <a href="mahasiswa?action=edit&id=${m.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="mahasiswa?action=delete&id=${m.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Yakin ingin menghapus data mahasiswa ini?')">Hapus</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
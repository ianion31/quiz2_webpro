<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Data Program Studi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Data Program Studi</h3>
        <div>
            <a href="dashboard.jsp" class="btn btn-secondary">Kembali</a>
            <a href="prodi?action=new" class="btn btn-primary">+ Tambah Prodi</a>
        </div>
    </div>
    <table class="table table-bordered table-striped bg-white">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Kode Prodi</th>
                <th>Nama Prodi</th>
                <th>Jenjang</th>
                <th>Kuota</th>
                <th width="160">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${listProdi}">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.kodeProdi}</td>
                    <td>${p.namaProdi}</td>
                    <td>${p.jenjang}</td>
                    <td>${p.kuota}</td>
                    <td>
                        <a href="prodi?action=edit&id=${p.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="prodi?action=delete&id=${p.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Hapus program studi ini?')">Hapus</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
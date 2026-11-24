<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Data Pengumuman</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Data Pengumuman</h3>
        <div>
            <a href="dashboard.jsp" class="btn btn-secondary">Kembali</a>
            <a href="pengumuman?action=new" class="btn btn-primary">+ Tambah Pengumuman</a>
        </div>
    </div>
    <table class="table table-bordered table-striped bg-white">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Judul</th>
                <th>Isi Pengumuman</th>
                <th>Tanggal Publish</th>
                <th>Status</th>
                <th width="160">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="pg" items="${listPengumuman}">
                <tr>
                    <td>${pg.id}</td>
                    <td>${pg.judul}</td>
                    <td>${pg.isi}</td>
                    <td>${pg.tanggalPublish}</td>
                    <td>${pg.statusAktif == 1 ? 'Aktif' : 'Nonaktif'}</td>
                    <td>
                        <a href="pengumuman?action=edit&id=${pg.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="pengumuman?action=delete&id=${pg.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Hapus pengumuman ini?')">Hapus</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
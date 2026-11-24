<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Data Jalur Masuk</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Data Jalur Masuk</h3>
        <div>
            <a href="dashboard.jsp" class="btn btn-secondary">Kembali</a>
            <a href="jalur-masuk?action=new" class="btn btn-primary">+ Tambah Jalur</a>
        </div>
    </div>
    <table class="table table-bordered table-striped bg-white">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nama Jalur</th>
                <th width="180">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="j" items="${listJalur}">
                <tr>
                    <td>${j.id}</td>
                    <td>${j.namaJalur}</td>
                    <td>
                        <a href="jalur-masuk?action=edit&id=${j.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="jalur-masuk?action=delete&id=${j.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Yakin ingin menghapus data ini?')">Hapus</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
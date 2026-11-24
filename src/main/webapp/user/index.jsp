<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manajemen User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Manajemen User</h3>
        <div>
            <a href="dashboard.jsp" class="btn btn-secondary">Kembali</a>
            <a href="user?action=new" class="btn btn-primary">+ Tambah User</a>
        </div>
    </div>
    <table class="table table-bordered table-striped bg-white">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nama</th>
                <th>Email</th>
                <th width="160">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${listUser}">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.name}</td>
                    <td>${u.email}</td>
                    <td>
                        <a href="user?action=edit&id=${u.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="user?action=delete&id=${u.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Hapus user ini?')">Hapus</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
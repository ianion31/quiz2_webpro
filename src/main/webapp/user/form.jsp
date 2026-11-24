<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h3>${user != null ? 'Edit' : 'Tambah'} User</h3>
    <form action="user" method="post" class="card p-4 mt-3">
        <input type="hidden" name="id" value="${user.id}">
        <div class="mb-3">
            <label class="form-label">Nama</label>
            <input type="text" name="name" class="form-control" value="${user.name}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" value="${user.email}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" value="${user.password}" required>
        </div>
        <div>
            <button type="submit" class="btn btn-success">Simpan</button>
            <a href="user" class="btn btn-secondary">Batal</a>
        </div>
    </form>
</body>
</html>
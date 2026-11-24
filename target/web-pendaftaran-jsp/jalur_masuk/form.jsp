<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Jalur Masuk</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h3>${jalur != null ? 'Edit' : 'Tambah'} Jalur Masuk</h3>
    <form action="jalur-masuk" method="post" class="card p-4 mt-3">
        <input type="hidden" name="id" value="${jalur.id}">
        <div class="mb-3">
            <label class="form-label">Nama Jalur Masuk</label>
            <input type="text" name="nama_jalur" class="form-control" value="${jalur.namaJalur}" required>
        </div>
        <div>
            <button type="submit" class="btn btn-success">Simpan</button>
            <a href="jalur-masuk" class="btn btn-secondary">Batal</a>
        </div>
    </form>
</body>
</html>
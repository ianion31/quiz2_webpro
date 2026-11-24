<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Mahasiswa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h3>${mhs != null ? 'Edit' : 'Tambah'} Mahasiswa</h3>
    <form action="mahasiswa" method="post" class="card p-4 mt-3">
        <input type="hidden" name="id" value="${mhs.id}">
        <div class="mb-3">
            <label class="form-label">Nama Lengkap</label>
            <input type="text" name="nama" class="form-control" value="${mhs.nama}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">NRP</label>
            <input type="text" name="nrp" class="form-control" value="${mhs.nrp}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Angkatan</label>
            <input type="text" name="angkatan" class="form-control" value="${mhs.angkatan}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Jalur Masuk</label>
            <select name="jalur_masuk_id" class="form-select" required>
                <c:forEach var="j" items="${listJalur}">
                    <option value="${j.id}" ${mhs.jalurMasukId == j.id ? 'selected' : ''}>
                        ${j.namaJalur}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div>
            <button type="submit" class="btn btn-success">Simpan</button>
            <a href="mahasiswa" class="btn btn-secondary">Batal</a>
        </div>
    </form>
</body>
</html>
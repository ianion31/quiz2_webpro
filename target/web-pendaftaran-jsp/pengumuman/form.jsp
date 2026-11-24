<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Pengumuman</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h3>${pengumuman != null ? 'Edit' : 'Tambah'} Pengumuman</h3>
    <form action="pengumuman" method="post" class="card p-4 mt-3">
        <input type="hidden" name="id" value="${pengumuman.id}">
        <div class="mb-3">
            <label class="form-label">Judul Pengumuman</label>
            <input type="text" name="judul" class="form-control" value="${pengumuman.judul}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Isi Pengumuman</label>
            <textarea name="isi" class="form-control" rows="4" required>${pengumuman.isi}</textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Tanggal Publish</label>
            <input type="date" name="tanggal_publish" class="form-control" value="${pengumuman.tanggalPublish}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Status Publikasi</label>
            <select name="status_aktif" class="form-select" required>
                <option value="1" ${pengumuman.statusAktif == 1 || pengumuman == null ? 'selected' : ''}>Aktif</option>
                <option value="0" ${pengumuman != null && pengumuman.statusAktif == 0 ? 'selected' : ''}>Nonaktif</option>
            </select>
        </div>
        <div>
            <button type="submit" class="btn btn-success">Simpan</button>
            <a href="pengumuman" class="btn btn-secondary">Batal</a>
        </div>
    </form>
</body>
</html>
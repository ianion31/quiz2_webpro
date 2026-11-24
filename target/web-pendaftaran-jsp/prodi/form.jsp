<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Program Studi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h3>${prodi != null ? 'Edit' : 'Tambah'} Program Studi</h3>
    <form action="prodi" method="post" class="card p-4 mt-3">
        <input type="hidden" name="id" value="${prodi.id}">
        <div class="mb-3">
            <label class="form-label">Kode Prodi</label>
            <input type="text" name="kode_prodi" class="form-control" value="${prodi.kodeProdi}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Nama Prodi</label>
            <input type="text" name="nama_prodi" class="form-control" value="${prodi.namaProdi}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Jenjang</label>
            <select name="jenjang" class="form-select" required>
                <option value="D3" ${prodi.jenjang == 'D3' ? 'selected' : ''}>D3</option>
                <option value="D4" ${prodi.jenjang == 'D4' ? 'selected' : ''}>D4</option>
                <option value="S1" ${prodi.jenjang == 'S1' || prodi == null ? 'selected' : ''}>S1</option>
                <option value="S2" ${prodi.jenjang == 'S2' ? 'selected' : ''}>S2</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Kuota</label>
            <input type="number" name="kuota" class="form-control" value="${prodi.kuota}" required>
        </div>
        <div>
            <button type="submit" class="btn btn-success">Simpan</button>
            <a href="prodi" class="btn btn-secondary">Batal</a>
        </div>
    </form>
</body>
</html>
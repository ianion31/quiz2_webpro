<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Berkas Pendaftaran</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h3>${berkas != null ? 'Edit' : 'Tambah'} Berkas Pendaftaran</h3>
    <form action="berkas" method="post" class="card p-4 mt-3">
        <input type="hidden" name="id" value="${berkas.id}">
        <div class="mb-3">
            <label class="form-label">Mahasiswa</label>
            <select name="mahasiswa_id" class="form-select" required>
                <c:forEach var="m" items="${listMhs}">
                    <option value="${m.id}" ${berkas.mahasiswaId == m.id ? 'selected' : ''}>
                        ${m.nrp} - ${m.nama}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Jenis Berkas</label>
            <input type="text" name="jenis_berkas" class="form-control" value="${berkas.jenisBerkas}" placeholder="Contoh: Kartu Keluarga / SKL" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Path File</label>
            <input type="text" name="file_path" class="form-control" value="${berkas.filePath}" placeholder="uploads/berkas/dokumen.pdf" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Status Verifikasi</label>
            <select name="status_verifikasi" class="form-select" required>
                <option value="Menunggu" ${berkas.statusVerifikasi == 'Menunggu' ? 'selected' : ''}>Menunggu</option>
                <option value="Valid" ${berkas.statusVerifikasi == 'Valid' ? 'selected' : ''}>Valid</option>
                <option value="Ditolak" ${berkas.statusVerifikasi == 'Ditolak' ? 'selected' : ''}>Ditolak</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Catatan</label>
            <textarea name="catatan" class="form-control" rows="2">${berkas.catatan}</textarea>
        </div>
        <div>
            <button type="submit" class="btn btn-success">Simpan</button>
            <a href="berkas" class="btn btn-secondary">Batal</a>
        </div>
    </form>
</body>
</html>
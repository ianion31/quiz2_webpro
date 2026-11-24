<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Pembayaran</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h3>${pembayaran != null ? 'Edit' : 'Tambah'} Pembayaran</h3>
    <form action="pembayaran" method="post" class="card p-4 mt-3">
        <input type="hidden" name="id" value="${pembayaran.id}">
        <div class="mb-3">
            <label class="form-label">Mahasiswa</label>
            <select name="mahasiswa_id" class="form-select" required>
                <c:forEach var="m" items="${listMhs}">
                    <option value="${m.id}" ${pembayaran.mahasiswaId == m.id ? 'selected' : ''}>
                        ${m.nrp} - ${m.nama}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Kode Pembayaran</label>
            <input type="text" name="kode_pembayaran" class="form-control" value="${pembayaran.kodePembayaran}" placeholder="INV-2026-004" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Nominal (Rp)</label>
            <input type="number" step="0.01" name="nominal" class="form-control" value="${pembayaran.nominal}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Metode Bayar</label>
            <input type="text" name="metode_bayar" class="form-control" value="${pembayaran.metodeBayar}" placeholder="QRIS / Transfer VA" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Status Bayar</label>
            <select name="status_bayar" class="form-select" required>
                <option value="Belum Lunas" ${pembayaran.statusBayar == 'Belum Lunas' ? 'selected' : ''}>Belum Lunas</option>
                <option value="Lunas" ${pembayaran.statusBayar == 'Lunas' ? 'selected' : ''}>Lunas</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Tanggal Bayar (Kosongkan jika belum lunas)</label>
            <input type="date" name="tanggal_bayar" class="form-control" value="${pembayaran.tanggalBayar}">
        </div>
        <div>
            <button type="submit" class="btn btn-success">Simpan</button>
            <a href="pembayaran" class="btn btn-secondary">Batal</a>
        </div>
    </form>
</body>
</html>
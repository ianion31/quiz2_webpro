<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Data Pembayaran</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Data Pembayaran Pendaftaran</h3>
        <div>
            <a href="dashboard.jsp" class="btn btn-secondary">Kembali</a>
            <a href="pembayaran?action=new" class="btn btn-primary">+ Tambah Pembayaran</a>
        </div>
    </div>
    <table class="table table-bordered table-striped bg-white">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>ID Mahasiswa</th>
                <th>Kode Invoice</th>
                <th>Nominal</th>
                <th>Metode Bayar</th>
                <th>Status</th>
                <th>Tanggal Bayar</th>
                <th width="160">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="pb" items="${listPembayaran}">
                <tr>
                    <td>${pb.id}</td>
                    <td>${pb.mahasiswaId}</td>
                    <td>${pb.kodePembayaran}</td>
                    <td>${pb.nominal}</td>
                    <td>${pb.metodeBayar}</td>
                    <td>${pb.statusBayar}</td>
                    <td>${pb.tanggalBayar != null ? pb.tanggalBayar : '-'}</td>
                    <td>
                        <a href="pembayaran?action=edit&id=${pb.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="pembayaran?action=delete&id=${pb.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Hapus data pembayaran ini?')">Hapus</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard Pendaftaran Mahasiswa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-dark bg-primary px-4">
    <span class="navbar-brand fw-bold">Sistem Pendaftaran Mahasiswa (JSP)</span>
    <a href="auth?action=logout" class="btn btn-outline-light btn-sm">Logout</a>
</nav>
<div class="container mt-4">
    <h4 class="mb-3">Menu Manajemen Data (8 Modul CRUD)</h4>
    <div class="row g-3">
        <div class="col-md-3"><a href="jalur-masuk" class="btn btn-white border shadow-sm w-100 p-3">1. Data Jalur Masuk</a></div>
        <div class="col-md-3"><a href="mahasiswa" class="btn btn-white border shadow-sm w-100 p-3">2. Data Mahasiswa</a></div>
        <div class="col-md-3"><a href="prodi" class="btn btn-white border shadow-sm w-100 p-3">3. Data Program Studi</a></div>
        <div class="col-md-3"><a href="berkas" class="btn btn-white border shadow-sm w-100 p-3">4. Berkas Pendaftaran</a></div>
        <div class="col-md-3"><a href="jadwal" class="btn btn-white border shadow-sm w-100 p-3">5. Jadwal Seleksi</a></div>
        <div class="col-md-3"><a href="pembayaran" class="btn btn-white border shadow-sm w-100 p-3">6. Pembayaran</a></div>
        <div class="col-md-3"><a href="pengumuman" class="btn btn-white border shadow-sm w-100 p-3">7. Pengumuman</a></div>
        <div class="col-md-3"><a href="user" class="btn btn-white border shadow-sm w-100 p-3">8. Manajemen User</a></div>
    </div>
</div>
</body>
</html>
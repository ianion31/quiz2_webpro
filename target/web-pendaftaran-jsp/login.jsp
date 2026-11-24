<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Sistem Pendaftaran Mahasiswa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="min-height: 100vh;">
    <div class="card shadow-sm p-4" style="width: 100%; max-width: 400px;">
        <h4 class="text-center mb-3">Login Sistem Pendaftaran</h4>

        <c:if test="${not empty error}">
            <div class="alert alert-danger py-2">${error}</div>
        </c:if>

        <form action="auth" method="post">
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Masuk</button>
        </form>
        <div class="text-center mt-3">
            <a href="dashboard.jsp" class="text-decoration-none small">Masuk langsung ke Dashboard (Mode Uji Coba)</a>
        </div>
    </div>
</body>
</html>
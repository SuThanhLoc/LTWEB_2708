<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Lại Mật Khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
        body { background-color: #f0f2f5; }
        .reset-container { max-width: 450px; margin-top: 8vh; }
    </style>
</head>
<body>
    <div class="container">
        <div class="card shadow-lg mx-auto reset-container">
            <div class="card-header bg-primary text-white text-center py-3">
                <h3 class="mb-0"><i class="fas fa-key me-2"></i>Đặt Lại Mật Khẩu</h3>
            </div>
            <div class="card-body p-4 p-md-5">

                <%-- Hiển thị thông báo lỗi từ Servlet --%>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">${error}</div>
                </c:if>

                <p class="text-muted mb-4">
                    Nhập thông tin tài khoản và mật khẩu mới của bạn.
                </p>

                <form action="<c:url value='/reset-password-simple' />" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label"><strong>Tên đăng nhập</strong></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label"><strong>Địa chỉ email</strong></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                    </div>
                    
                    <hr>

                    <div class="mb-3">
                        <label for="newPassword" class="form-label"><strong>Mật khẩu mới</strong></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="confirmPassword" class="form-label"><strong>Xác nhận mật khẩu mới</strong></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        </div>
                    </div>
                    
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg fw-bold">Xác nhận & Đổi Mật khẩu</button>
                    </div>
                </form>

                <div class="text-center mt-4">
                    <a href="<c:url value='/login' />" class="text-decoration-none">
                        <i class="fas fa-arrow-left me-1"></i> Quay lại trang đăng nhập
                    </a>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
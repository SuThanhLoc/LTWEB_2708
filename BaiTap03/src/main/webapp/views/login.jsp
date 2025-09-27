<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập hệ thống</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    
    <style>
        body {
            background-color: #f0f2f5; /* Màu nền nhẹ nhàng */
        }
        .login-container {
            max-width: 450px;
            margin-top: 8vh; /* Canh giữa theo chiều dọc */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card shadow-lg mx-auto login-container">
            <div class="card-header bg-primary text-white text-center py-3">
                <h3 class="mb-0">
                    <i class="fas fa-sign-in-alt me-2"></i>Đăng Nhập
                </h3>
            </div>
            <div class="card-body p-4 p-md-5">

                <%-- Sử dụng JSTL để hiển thị thông báo lỗi, an toàn và sạch sẽ hơn --%>
                <c:if test="${not empty alert}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        ${alert}
                    </div>
                </c:if>

                <%-- Form đăng nhập, action sử dụng contextPath để luôn đúng --%>
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label"><strong>Tài khoản</strong></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <input type="text" class="form-control" id="username" name="username"
                                placeholder="Nhập tài khoản của bạn" required>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label for="password" class="form-label"><strong>Mật khẩu</strong></label>
                         <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" class="form-control" id="password" name="password"
                                placeholder="Nhập mật khẩu" required>
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="remember-me" name="remember-me"> 
                            <label class="form-check-label" for="remember-me">Ghi nhớ tôi</label>
                        </div>
                        <div>
                            <%-- Bạn có thể thêm link đến trang quên mật khẩu ở đây nếu có --%>
                            <a href="reset-password-simple" class="text-decoration-none">Quên mật khẩu?</a>
                        </div>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg fw-bold">Đăng nhập</button>
                    </div>
                </form>

                <hr class="my-4">

                <div class="text-center">
                    <p class="mb-0">Chưa có tài khoản? 
                        <a href="${pageContext.request.contextPath}/register" class="fw-bold text-decoration-none">Đăng ký ngay</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
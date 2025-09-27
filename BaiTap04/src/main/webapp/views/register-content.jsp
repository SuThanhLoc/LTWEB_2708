<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>

<page:applyDecorator name="login">
    <page:param name="title">Đăng ký tài khoản</page:param>
    
    <style>
        body {
            background-color: #f0f2f5;
        }
        .register-container {
            max-width: 500px;
            margin-top: 5vh;
        }
    </style>

    <div class="container">
        <div class="card shadow-lg mx-auto register-container">
            <div class="card-header bg-success text-white text-center py-3">
                <h3 class="mb-0">
                    <i class="fas fa-user-plus me-2"></i>Đăng Ký Tài Khoản
                </h3>
            </div>
            <div class="card-body p-4 p-md-5">

                <c:if test="${not empty alert}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        ${alert}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/register" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label"><strong>Tên đăng nhập</strong></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <input type="text" class="form-control" id="username" name="username"
                                placeholder="Nhập tên đăng nhập" required>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="fullname" class="form-label"><strong>Họ và tên</strong></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-id-card"></i></span>
                            <input type="text" class="form-control" id="fullname" name="fullname"
                                placeholder="Nhập họ và tên" required>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="email" class="form-label"><strong>Email</strong></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="email" class="form-control" id="email" name="email"
                                placeholder="Nhập email" required>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="phone" class="form-label"><strong>Số điện thoại</strong></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-phone"></i></span>
                            <input type="tel" class="form-control" id="phone" name="phone"
                                placeholder="Nhập số điện thoại">
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="password" class="form-label"><strong>Mật khẩu</strong></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" class="form-control" id="password" name="password"
                                placeholder="Nhập mật khẩu" required>
                        </div>
                    </div>
                    
                    <div class="mb-4">
                        <label for="confirmPassword" class="form-label"><strong>Xác nhận mật khẩu</strong></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
                                placeholder="Nhập lại mật khẩu" required>
                        </div>
                    </div>
                    
                    <div class="d-grid">
                        <button type="submit" class="btn btn-success btn-lg fw-bold">Đăng ký</button>
                    </div>
                </form>

                <hr class="my-4">

                <div class="text-center">
                    <p class="mb-0">Đã có tài khoản? 
                        <a href="${pageContext.request.contextPath}/login" class="fw-bold text-decoration-none">Đăng nhập ngay</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</page:applyDecorator>

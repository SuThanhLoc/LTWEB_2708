<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>

<page:applyDecorator name="login">
    <page:param name="title">Đặt lại mật khẩu</page:param>
    
    <style>
        body {
            background-color: #f0f2f5;
        }
        .reset-container {
            max-width: 450px;
            margin-top: 8vh;
        }
    </style>

    <div class="container">
        <div class="card shadow-lg mx-auto reset-container">
            <div class="card-header bg-primary text-white text-center py-3">
                <h3 class="mb-0">
                    <i class="fas fa-key me-2"></i>Đặt Lại Mật Khẩu
                </h3>
            </div>
            <div class="card-body p-4 p-md-5">

                <c:if test="${not empty alert}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        ${alert}
                    </div>
                </c:if>

                <c:if test="${not empty success}">
                    <div class="alert alert-success" role="alert">
                        <i class="fas fa-check-circle me-2"></i>
                        ${success}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/reset-password-simple" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label"><strong>Email</strong></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="email" class="form-control" id="email" name="email"
                                placeholder="Nhập email của bạn" required>
                        </div>
                    </div>
                    
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg fw-bold">Gửi Link Đặt Lại</button>
                    </div>
                </form>

                <hr class="my-4">

                <div class="text-center">
                    <p class="mb-0">Nhớ mật khẩu? 
                        <a href="${pageContext.request.contextPath}/login" class="fw-bold text-decoration-none">Đăng nhập ngay</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</page:applyDecorator>

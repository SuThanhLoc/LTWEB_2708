<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<footer class="bg-dark text-light py-4 mt-auto">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <h5 class="text-primary">
                    <i class="fas fa-video me-2"></i>Video Platform
                </h5>
                <p class="mb-0">A modern video sharing platform built with Java Servlet, JSP and Bootstrap.</p>
            </div>
            <div class="col-md-4">
                <h6>Quick Links</h6>
                <ul class="list-unstyled">
                    <li><a href="<c:url value='/home'/>" class="text-light text-decoration-none">Home</a></li>
                    <li><a href="<c:url value='/about'/>" class="text-light text-decoration-none">About</a></li>
                    <c:if test="${sessionScope.user != null}">
                        <li><a href="<c:url value='/profile'/>" class="text-light text-decoration-none">Profile</a></li>
                    </c:if>
                </ul>
            </div>
            <div class="col-md-4 text-end">
                <h6>Contact</h6>
                <p class="mb-0">
                    <i class="fas fa-envelope me-2"></i>contact@videoplatform.com
                </p>
                <p class="mb-0">
                    <i class="fas fa-phone me-2"></i>+84 123 456 789
                </p>
                <hr class="my-2">
                <p class="mb-0 small">&copy; 2024 Video Platform. All rights reserved.</p>
            </div>
        </div>
    </div>
</footer>

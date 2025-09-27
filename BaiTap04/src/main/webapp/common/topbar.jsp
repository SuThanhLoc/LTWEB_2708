<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="<c:url value='/home'/>">
            <i class="fas fa-video me-2"></i>Video Platform
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <c:choose>
                    <c:when test="${sessionScope.user != null}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user me-1"></i>${sessionScope.user.fullName}
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="<c:url value='/profile'/>">
                                    <i class="fas fa-user-edit me-2"></i>Profile
                                </a></li>
                                <c:if test="${sessionScope.user.roleid == 1 || sessionScope.user.roleid == 2}">
                                    <li><hr class="dropdown-divider"></li>
                                    <li><h6 class="dropdown-header">
                                        <i class="fas fa-shield-alt me-2"></i>Management
                                    </h6></li>
                                    <li><a class="dropdown-item" href="<c:url value='/admin/home'/>">
                                        <i class="fas fa-tachometer-alt me-2"></i>Dashboard
                                    </a></li>
                                    <li><a class="dropdown-item" href="<c:url value='/category-management'/>">
                                        <i class="fas fa-tags me-2"></i>Categories
                                    </a></li>
                                    <li><a class="dropdown-item" href="<c:url value='/admin/videos'/>">
                                        <i class="fas fa-video me-2"></i>Videos
                                    </a></li>
                                    <c:if test="${sessionScope.user.roleid == 1}">
                                        <li><a class="dropdown-item" href="<c:url value='/admin/users'/>">
                                            <i class="fas fa-users me-2"></i>Users
                                        </a></li>
                                    </c:if>
                                </c:if>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="<c:url value='/logout'/>">
                                    <i class="fas fa-sign-out-alt me-2"></i>Logout
                                </a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/login'/>">
                                <i class="fas fa-sign-in-alt me-1"></i>Login
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/register'/>">
                                <i class="fas fa-user-plus me-1"></i>Register
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

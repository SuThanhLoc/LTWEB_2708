<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<nav class="sidebar bg-light border-end" style="min-height: calc(100vh - 200px);">
    <div class="p-3">
        <ul class="nav nav-pills flex-column">
            <li class="nav-item mb-2">
                <a class="nav-link ${fn:contains(pageContext.request.requestURI, '/home') ? 'active' : ''}" 
                   href="<c:url value='/home'/>">
                    <i class="fas fa-home me-2"></i>Home
                </a>
            </li>
            
            <c:if test="${sessionScope.user != null}">
                <li class="nav-item mb-2">
                    <a class="nav-link ${fn:contains(pageContext.request.requestURI, '/profile') ? 'active' : ''}" 
                       href="<c:url value='/profile'/>">
                        <i class="fas fa-user me-2"></i>Profile
                    </a>
                </li>
                
                <c:if test="${sessionScope.user.roleid == 1 || sessionScope.user.roleid == 2}">
                    <hr class="my-2">
                    <li class="nav-item mb-1">
                        <small class="text-muted px-3">
                            <i class="fas fa-shield-alt me-1"></i>Management
                        </small>
                    </li>
                    <li class="nav-item mb-2">
                        <a class="nav-link ${fn:contains(pageContext.request.requestURI, '/admin') ? 'active' : ''}" 
                           href="<c:url value='/admin/home'/>">
                            <i class="fas fa-tachometer-alt me-2"></i>Dashboard
                        </a>
                    </li>
                    <li class="nav-item mb-2">
                        <a class="nav-link ${fn:contains(pageContext.request.requestURI, '/category-management') ? 'active' : ''}" 
                           href="<c:url value='/category-management'/>">
                            <i class="fas fa-tags me-2"></i>Categories
                        </a>
                    </li>
                    <li class="nav-item mb-2">
                        <a class="nav-link" href="<c:url value='/admin/videos'/>">
                            <i class="fas fa-video me-2"></i>Videos
                        </a>
                    </li>
                    <c:if test="${sessionScope.user.roleid == 1}">
                        <li class="nav-item mb-2">
                            <a class="nav-link" href="<c:url value='/admin/users'/>">
                                <i class="fas fa-users me-2"></i>Users
                            </a>
                        </li>
                    </c:if>
                </c:if>
            </c:if>
            
            <li class="nav-item mb-2">
                <a class="nav-link" href="<c:url value='/about'/>">
                    <i class="fas fa-info-circle me-2"></i>About
                </a>
            </li>
        </ul>
        
        <hr class="my-3">
        
        <div class="text-center">
            <small class="text-muted">
                <i class="fas fa-heart text-danger"></i> 
                Made with love
            </small>
        </div>
    </div>
</nav>

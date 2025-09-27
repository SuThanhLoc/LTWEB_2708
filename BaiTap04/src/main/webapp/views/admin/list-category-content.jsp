<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-list text-primary me-2"></i>
                    <h4 class="mb-0 text-primary">Category List</h4>
                </div>
                <a href="<c:url value='/admin/category/add'/>" class="btn btn-primary">
                    <i class="fas fa-plus me-2"></i>Add New Category
                </a>
            </div>
        </div>
    </div>

    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle me-2"></i>${success}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>
    
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i>${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">
                        <i class="fas fa-tags me-2"></i>All Categories
                    </h5>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${not empty categories}">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-light">
                                        <tr>
                                            <th>ID</th>
                                            <th>Icon</th>
                                            <th>Name</th>
                                            <th>Description</th>
                                            <th>Created Date</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="category" items="${categories}">
                                            <tr>
                                                <td>${category.id}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty category.icon}">
                                                            <c:set var="fileName" value="${category.icon}" />
                                                            <c:if test="${category.icon.startsWith('uploads/')}">
                                                                <c:set var="fileName" value="${category.icon.substring(8)}" />
                                                            </c:if>
                                                            <img src="<c:url value='/download-image?fname=${fileName}'/>" 
                                                                 alt="${category.name} icon" 
                                                                 class="img-thumbnail" 
                                                                 style="width: 40px; height: 40px; object-fit: cover;"
                                                                 onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
                                                            <div class="bg-light d-flex align-items-center justify-content-center" 
                                                                 style="width: 40px; height: 40px; border-radius: 4px; display: none;">
                                                                <i class="fas fa-image text-muted"></i>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="bg-light d-flex align-items-center justify-content-center" 
                                                                 style="width: 40px; height: 40px; border-radius: 4px;">
                                                                <i class="fas fa-tag text-muted"></i>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <strong>${category.name}</strong>
                                                    </div>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty category.description}">
                                                            ${category.description}
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="text-muted">No description</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty category.createdDate}">
                                                            <small class="text-muted">${category.createdDate}</small>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="text-muted">-</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <div class="btn-group" role="group">
                                                        <a href="<c:url value='/admin/category/edit?id=${category.id}'/>" 
                                                           class="btn btn-sm btn-outline-primary" title="Edit">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                        <a href="<c:url value='/admin/category/delete?id=${category.id}'/>" 
                                                           class="btn btn-sm btn-outline-danger" 
                                                           onclick="return confirm('Are you sure you want to delete this category?')" 
                                                           title="Delete">
                                                            <i class="fas fa-trash"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-5">
                                <i class="fas fa-folder-open fa-3x text-muted mb-3"></i>
                                <h5 class="text-muted">No categories found</h5>
                                <p class="text-muted">Start by adding your first category.</p>
                                <a href="<c:url value='/admin/category/add'/>" class="btn btn-primary">
                                    <i class="fas fa-plus me-2"></i>Add First Category
                                </a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
// Auto-hide alerts
document.addEventListener('DOMContentLoaded', function() {
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
        if (alert.classList.contains('alert-dismissible')) {
            setTimeout(() => {
                const bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            }, 5000);
        }
    });
});
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-edit text-primary me-2"></i>
                    <h4 class="mb-0 text-primary">Edit Category</h4>
                </div>
                <a href="<c:url value='/admin/category/list'/>" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Back to Categories
                </a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">
                        <i class="fas fa-tag me-2"></i>Category Information
                    </h5>
                </div>
                <div class="card-body">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fas fa-exclamation-circle me-2"></i>${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>
                    
                    <c:if test="${not empty success}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="fas fa-check-circle me-2"></i>${success}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <form action="<c:url value='/admin/category/edit'/>" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${category.id}">
                        
                        <div class="mb-3">
                            <label for="name" class="form-label">
                                <i class="fas fa-tag me-1"></i>Category Name <span class="text-danger">*</span>
                            </label>
                            <input type="text" class="form-control" id="name" name="name" 
                                   value="${category.name}" placeholder="Enter category name" required>
                            <div class="form-text">This will be the display name for the category.</div>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">
                                <i class="fas fa-align-left me-1"></i>Description
                            </label>
                            <textarea class="form-control" id="description" name="description" 
                                      rows="4" placeholder="Enter category description (optional)">${category.description}</textarea>
                            <div class="form-text">Provide a brief description of what this category represents.</div>
                        </div>

                        <div class="mb-4">
                            <label for="icon" class="form-label">
                                <i class="fas fa-image me-1"></i>Category Icon
                            </label>
                            <c:if test="${not empty category.icon}">
                                <div class="mb-2">
                                    <label class="form-label text-muted">Current Icon:</label>
                                    <div>
                                        <img src="<c:url value='/${category.icon}'/>" alt="Current icon" 
                                             class="img-thumbnail" style="max-width: 100px; max-height: 100px;"
                                             onerror="this.style.display='none'; this.nextElementSibling.style.display='block';">
                                        <div class="bg-light d-flex align-items-center justify-content-center" 
                                             style="width: 100px; height: 100px; border-radius: 4px; display: none;">
                                            <i class="fas fa-image text-muted"></i>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <input type="file" class="form-control" id="icon" name="icon" 
                                   accept="image/*" onchange="previewImage(this)">
                            <div class="form-text">Upload a new icon for this category (JPG, PNG, GIF supported). Leave empty to keep current icon.</div>
                            <div id="imagePreview" class="mt-2" style="display: none;">
                                <label class="form-label text-muted">New Icon Preview:</label>
                                <img id="previewImg" src="" alt="Preview" class="img-thumbnail" style="max-width: 200px; max-height: 200px;">
                            </div>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="<c:url value='/admin/category/list'/>" class="btn btn-outline-secondary me-md-2">
                                <i class="fas fa-times me-2"></i>Cancel
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-2"></i>Update Category
                            </button>
                        </div>
                    </form>
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

// Image preview function
function previewImage(input) {
    const preview = document.getElementById('imagePreview');
    const previewImg = document.getElementById('previewImg');
    
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        
        reader.onload = function(e) {
            previewImg.src = e.target.result;
            preview.style.display = 'block';
        };
        
        reader.readAsDataURL(input.files[0]);
    } else {
        preview.style.display = 'none';
    }
}
</script>

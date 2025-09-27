<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="h3 mb-0">
                    <i class="fas fa-user-edit me-2"></i>Profile Management
                </h2>
                <a href="<c:url value='/home'/>" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Back to Home
                </a>
            </div>
        </div>
    </div>

    <!-- Alert Messages -->
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
        <!-- Profile Information Card -->
        <div class="col-lg-4 mb-4">
            <div class="card">
                <div class="card-body text-center">
                    <div class="mb-3">
                        <c:choose>
                            <c:when test="${not empty user.avatar}">
                                <img src="<c:url value='/download-image?fname=${user.avatar}'/>" 
                                     alt="Profile Avatar" class="profile-avatar" id="currentAvatar">
                            </c:when>
                            <c:otherwise>
                                <div class="profile-avatar bg-secondary d-flex align-items-center justify-content-center">
                                    <i class="fas fa-user fa-3x text-white"></i>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    
                    <h5 class="card-title">${user.fullName}</h5>
                    <p class="text-muted mb-1">${user.email}</p>
                    <p class="text-muted mb-1">${user.phone}</p>
                    
                    <c:choose>
                        <c:when test="${user.roleid == 1}">
                            <span class="badge bg-primary">Administrator</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-secondary">User</span>
                        </c:otherwise>
                    </c:choose>
                    
                    <hr class="my-3">
                    
                    <small class="text-muted">
                        <i class="fas fa-calendar me-1"></i>
                        Member since: <fmt:formatDate value="${user.createdDate}" pattern="MMM dd, yyyy"/>
                    </small>
                </div>
            </div>
        </div>

        <!-- Profile Edit Form -->
        <div class="col-lg-8">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">
                        <i class="fas fa-edit me-2"></i>Edit Profile Information
                    </h5>
                </div>
                <div class="card-body">
                    <form action="profile" method="POST" enctype="multipart/form-data">
                        
                        <!-- Full Name -->
                        <div class="mb-3">
                            <label for="fullName" class="form-label">
                                <i class="fas fa-user me-1"></i>Full Name
                            </label>
                            <input type="text" class="form-control" id="fullName" name="fullName" 
                                   value="${user.fullName}" required>
                        </div>

                        <!-- Phone -->
                        <div class="mb-3">
                            <label for="phone" class="form-label">
                                <i class="fas fa-phone me-1"></i>Phone Number
                            </label>
                            <input type="tel" class="form-control" id="phone" name="phone" 
                                   value="${user.phone}">
                        </div>

                        <!-- Avatar Upload -->
                        <div class="mb-3">
                            <label for="avatar" class="form-label">
                                <i class="fas fa-image me-1"></i>Profile Picture
                            </label>
                            <input type="file" class="form-control" id="avatar" name="avatar" 
                                   accept="image/*" onchange="previewImage(this)">
                            <div class="form-text">
                                Allowed formats: JPG, PNG, GIF. Maximum size: 5MB.
                            </div>
                            
                            <!-- Image Preview -->
                            <div class="mt-2" id="imagePreviewContainer" style="display: none;">
                                <img id="imagePreview" class="img-thumbnail" style="max-width: 200px; max-height: 200px;">
                            </div>
                        </div>
                        
                        <!-- Email (Read-only) -->
                        <div class="mb-3">
                            <label for="email" class="form-label">
                                <i class="fas fa-envelope me-1"></i>Email Address
                            </label>
                            <input type="email" class="form-control" id="email" value="${user.email}" readonly>
                            <div class="form-text">Email address cannot be changed.</div>
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button type="button" class="btn btn-outline-secondary me-md-2" 
                                    onclick="resetForm()">
                                <i class="fas fa-undo me-2"></i>Reset
                            </button>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-2"></i>Update Profile
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Account Information -->
            <div class="card mt-4">
                <div class="card-header">
                    <h5 class="card-title mb-0">
                        <i class="fas fa-info-circle me-2"></i>Account Information
                    </h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <strong>Username:</strong>
                            <p class="text-muted">${user.userName}</p>
                        </div>
                        <div class="col-md-6">
                            <strong>User ID:</strong>
                            <p class="text-muted">${user.id}</p>
                        </div>
                        <div class="col-md-6">
                            <strong>Role:</strong>
                            <p class="text-muted">
                                <c:choose>
                                    <c:when test="${user.roleid == 1}">Administrator</c:when>
                                    <c:otherwise>Regular User</c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                        <div class="col-md-6">
                            <strong>Member Since:</strong>
                            <p class="text-muted"><fmt:formatDate value="${user.createdDate}" pattern="MMMM dd, yyyy"/></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    /* Profile Styles */
    .profile-avatar {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        object-fit: cover;
        border: 4px solid #0d6efd;
    }
</style>

<script>
function previewImage(input) {
    const preview = document.getElementById('imagePreview');
    const container = document.getElementById('imagePreviewContainer');
    
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        
        reader.onload = function(e) {
            preview.src = e.target.result;
            container.style.display = 'block';
        };
        
        reader.readAsDataURL(input.files[0]);
    } else {
        container.style.display = 'none';
    }
}

function resetForm() {
    document.getElementById('fullName').value = '${user.fullName}';
    document.getElementById('phone').value = '${user.phone}';
    document.getElementById('avatar').value = '';
    document.getElementById('imagePreviewContainer').style.display = 'none';
    alert('Form has been reset to original values');
}

// Auto-hide alerts
document.addEventListener('DOMContentLoaded', function() {
    console.log('Profile form ready');
    
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
        if (alert.classList.contains('alert-dismissible')) {
            setTimeout(() => {
                const bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            }, 5000);
        }
    });
    
    const form = document.querySelector('form');
    if (form) {
        form.addEventListener('submit', function(event) {
            console.log('Form submitted');
            
            const submitBtn = form.querySelector('button[type="submit"]');
            if (submitBtn) {
                submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Updating...';
                submitBtn.disabled = true;
            }
        });
    }
});
</script>
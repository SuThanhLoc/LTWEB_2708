<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Video Platform</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <style>
        /* Custom styles for Video Platform */
        :root {
            --primary-color: #0d6efd;
            --secondary-color: #6c757d;
            --success-color: #198754;
            --danger-color: #dc3545;
            --warning-color: #ffc107;
            --info-color: #0dcaf0;
            --light-color: #f8f9fa;
            --dark-color: #212529;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Sidebar Styles */
        .sidebar {
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 0.375rem;
            margin: 1rem 0;
        }

        .sidebar .nav-link {
            color: #495057;
            border-radius: 0.375rem;
            margin-bottom: 0.25rem;
            transition: all 0.3s ease;
        }

        .sidebar .nav-link:hover {
            background-color: #e9ecef;
            color: var(--primary-color);
        }

        .sidebar .nav-link.active {
            background-color: var(--primary-color);
            color: white;
        }

        /* Page Content */
        .page-content {
            background-color: #fff;
            border-radius: 0.375rem;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin: 1rem 0;
            padding: 2rem;
            min-height: calc(100vh - 200px);
        }

        /* Card Styles */
        .card {
            border: none;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 0.5rem;
            transition: transform 0.3s ease;
            margin-bottom: 20px;
        }

        .card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        /* Statistics */
        .stat-item {
            padding: 1rem 0;
        }

        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            line-height: 1;
        }

        .stat-label {
            font-size: 0.875rem;
            color: #6c757d;
            margin-top: 0.25rem;
        }

        /* Footer styles */
        footer {
            margin-top: auto;
        }
    </style>
</head>
<body>
    <!-- Top Bar -->
    <%@include file="/common/topbar.jsp" %>
    
    <!-- Header -->
    <%@include file="/common/header.jsp" %>
    
    <div class="container-fluid">
        <div class="row">
            <!-- Left Sidebar -->
            <div class="col-md-3 col-lg-2">
                <%@include file="/common/leftbar.jsp" %>
            </div>
            
            <!-- Main Content -->
            <div class="col-md-9 col-lg-10">
                <main class="page-content">

<div class="container-fluid">
    <!-- Welcome Section -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card bg-primary text-white">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-md-8">
                            <h2 class="card-title mb-2">
                                <i class="fas fa-home me-2"></i>
                                Welcome back, ${sessionScope.user.fullName}!
                            </h2>
                            <p class="card-text mb-0">
                                Manage your videos, explore content, and connect with the community.
                            </p>
                        </div>
                        <div class="col-md-4 text-end">
                            <c:choose>
                                <c:when test="${not empty sessionScope.user.avatar}">
                                    <img src="<c:url value='/download-image?fname=${sessionScope.user.avatar}'/>" 
                                         alt="Profile Avatar" class="rounded-circle" 
                                         style="width: 80px; height: 80px; object-fit: cover;">
                                </c:when>
                                <c:otherwise>
                                    <div class="rounded-circle bg-light d-flex align-items-center justify-content-center" 
                                         style="width: 80px; height: 80px;">
                                        <i class="fas fa-user fa-2x text-primary"></i>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="row mb-4">
        <div class="col-12">
            <h4 class="mb-3">
                <i class="fas fa-bolt me-2"></i>Quick Actions
            </h4>
        </div>
        <div class="col-md-3 mb-3">
            <div class="card h-100 text-center">
                <div class="card-body">
                    <i class="fas fa-upload fa-3x text-primary mb-3"></i>
                    <h6 class="card-title">Upload Video</h6>
                    <p class="card-text small text-muted">Share your content with the world</p>
                    <a href="<c:url value='/admin/upload-video'/>" class="btn btn-primary btn-sm">
                        <i class="fas fa-plus me-1"></i>Upload
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-3">
            <div class="card h-100 text-center">
                <div class="card-body">
                    <i class="fas fa-user-edit fa-3x text-success mb-3"></i>
                    <h6 class="card-title">Edit Profile</h6>
                    <p class="card-text small text-muted">Update your personal information</p>
                    <a href="<c:url value='/profile'/>" class="btn btn-success btn-sm">
                        <i class="fas fa-edit me-1"></i>Edit
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-3">
            <div class="card h-100 text-center">
                <div class="card-body">
                    <i class="fas fa-video fa-3x text-info mb-3"></i>
                    <h6 class="card-title">My Videos</h6>
                    <p class="card-text small text-muted">Manage your uploaded content</p>
                    <a href="<c:url value='/admin/videos'/>" class="btn btn-info btn-sm">
                        <i class="fas fa-list me-1"></i>View
                    </a>
                </div>
            </div>
        </div>
        <c:if test="${sessionScope.user.roleid == 1 || sessionScope.user.roleid == 2}">
            <div class="col-md-3 mb-3">
                <div class="card h-100 text-center">
                    <div class="card-body">
                        <i class="fas fa-tachometer-alt fa-3x text-warning mb-3"></i>
                        <h6 class="card-title">Dashboard</h6>
                        <p class="card-text small text-muted">Management dashboard</p>
                        <a href="<c:url value='/admin/home'/>" class="btn btn-warning btn-sm">
                            <i class="fas fa-tachometer-alt me-1"></i>Open
                        </a>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.user.roleid != 1 && sessionScope.user.roleid != 2}">
            <div class="col-md-3 mb-3">
                <div class="card h-100 text-center">
                    <div class="card-body">
                        <i class="fas fa-cog fa-3x text-warning mb-3"></i>
                        <h6 class="card-title">Settings</h6>
                        <p class="card-text small text-muted">Configure your preferences</p>
                        <a href="<c:url value='/profile'/>" class="btn btn-warning btn-sm">
                            <i class="fas fa-cog me-1"></i>Settings
                        </a>
                    </div>
                </div>
            </div>
        </c:if>
    </div>

    <!-- Management Section for Admin/Manager -->
    <c:if test="${sessionScope.user.roleid == 1 || sessionScope.user.roleid == 2}">
        <div class="row mb-4">
            <div class="col-12">
                <h4 class="mb-3">
                    <i class="fas fa-shield-alt me-2"></i>Management Tools
                </h4>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card border-primary">
                    <div class="card-body text-center">
                        <i class="fas fa-tags fa-2x text-primary mb-3"></i>
                        <h6 class="card-title">Category Management</h6>
                        <p class="card-text small text-muted">Add, edit, delete video categories</p>
                        <a href="<c:url value='/category-management'/>" class="btn btn-primary btn-sm">
                            <i class="fas fa-tags me-1"></i>Manage Categories
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card border-success">
                    <div class="card-body text-center">
                        <i class="fas fa-video fa-2x text-success mb-3"></i>
                        <h6 class="card-title">Video Management</h6>
                        <p class="card-text small text-muted">Manage all videos and uploads</p>
                        <a href="<c:url value='/admin/videos'/>" class="btn btn-success btn-sm">
                            <i class="fas fa-video me-1"></i>Manage Videos
                        </a>
                    </div>
                </div>
            </div>
            <c:if test="${sessionScope.user.roleid == 1}">
                <div class="col-md-4 mb-3">
                    <div class="card border-warning">
                        <div class="card-body text-center">
                            <i class="fas fa-users fa-2x text-warning mb-3"></i>
                            <h6 class="card-title">User Management</h6>
                            <p class="card-text small text-muted">Manage users and permissions</p>
                            <a href="<c:url value='/admin/users'/>" class="btn btn-warning btn-sm">
                                <i class="fas fa-users me-1"></i>Manage Users
                            </a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </c:if>

    <!-- Recent Activity -->
    <div class="row">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">
                        <i class="fas fa-history me-2"></i>Recent Activity
                    </h5>
                </div>
                <div class="card-body">
                    <div class="list-group list-group-flush">
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            <div>
                                <i class="fas fa-upload text-primary me-2"></i>
                                <strong>Video Uploaded</strong>
                                <br>
                                <small class="text-muted">You uploaded "Sample Video.mp4"</small>
                            </div>
                            <small class="text-muted">2 hours ago</small>
                        </div>
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            <div>
                                <i class="fas fa-user-edit text-success me-2"></i>
                                <strong>Profile Updated</strong>
                                <br>
                                <small class="text-muted">You updated your profile information</small>
                            </div>
                            <small class="text-muted">1 day ago</small>
                        </div>
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            <div>
                                <i class="fas fa-sign-in-alt text-info me-2"></i>
                                <strong>Login</strong>
                                <br>
                                <small class="text-muted">You logged into your account</small>
                            </div>
                            <small class="text-muted">3 days ago</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Statistics -->
        <div class="col-lg-4">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">
                        <i class="fas fa-chart-bar me-2"></i>Your Statistics
                    </h5>
                </div>
                <div class="card-body">
                    <div class="row text-center">
                        <div class="col-6 mb-3">
                            <div class="stat-item">
                                <div class="stat-number text-primary">12</div>
                                <div class="stat-label">Videos</div>
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="stat-item">
                                <div class="stat-number text-success">1.2K</div>
                                <div class="stat-label">Views</div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="stat-item">
                                <div class="stat-number text-info">45</div>
                                <div class="stat-label">Likes</div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="stat-item">
                                <div class="stat-number text-warning">8</div>
                                <div class="stat-label">Comments</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Tips -->
            <div class="card mt-3">
                <div class="card-header">
                    <h5 class="card-title mb-0">
                        <i class="fas fa-lightbulb me-2"></i>Quick Tips
                    </h5>
                </div>
                <div class="card-body">
                    <div class="alert alert-info">
                        <i class="fas fa-info-circle me-2"></i>
                        <strong>Tip:</strong> Use descriptive titles and tags for better video discovery.
                    </div>
                    <div class="alert alert-success">
                        <i class="fas fa-check-circle me-2"></i>
                        <strong>Tip:</strong> Regular uploads help grow your audience.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
.stat-item {
    padding: 1rem 0;
}

.stat-number {
    font-size: 2rem;
    font-weight: bold;
    line-height: 1;
}

.stat-label {
    font-size: 0.875rem;
    color: #6c757d;
    margin-top: 0.25rem;
}

.card {
    transition: transform 0.2s ease-in-out;
}

.card:hover {
    transform: translateY(-2px);
}
</style>

                </main>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <%@include file="/common/footer.jsp" %>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Main JavaScript for Video Platform
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize tooltips
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });

            // Initialize popovers
            var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
            var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
                return new bootstrap.Popover(popoverTriggerEl);
            });

            // Auto-hide alerts
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                if (alert.classList.contains('alert-dismissible')) {
                    setTimeout(() => {
                        const bsAlert = new bootstrap.Alert(alert);
                        bsAlert.close();
                    }, 5000);
                }
            });

            // Search functionality
            const searchInput = document.querySelector('input[placeholder*="Search"]');
            if (searchInput) {
                searchInput.addEventListener('keypress', function(e) {
                    if (e.key === 'Enter') {
                        const searchTerm = this.value.trim();
                        if (searchTerm) {
                            // Implement search functionality here
                            console.log('Searching for:', searchTerm);
                        }
                    }
                });
            }

            // Smooth scrolling for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    const target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        target.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });
                    }
                });
            });
        });

        // Utility functions
        function showAlert(message, type = 'info') {
            const alertContainer = document.getElementById('alertContainer') || createAlertContainer();
            const alertId = 'alert-' + Date.now();
            
            const alertHTML = `
                <div id="${alertId}" class="alert alert-${type} alert-dismissible fade show" role="alert">
                    ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            `;
            
            alertContainer.insertAdjacentHTML('beforeend', alertHTML);
            
            // Auto-remove after 5 seconds
            setTimeout(() => {
                const alert = document.getElementById(alertId);
                if (alert) {
                    const bsAlert = new bootstrap.Alert(alert);
                    bsAlert.close();
                }
            }, 5000);
        }

        function createAlertContainer() {
            const container = document.createElement('div');
            container.id = 'alertContainer';
            container.className = 'position-fixed top-0 end-0 p-3';
            container.style.zIndex = '1050';
            document.body.appendChild(container);
            return container;
        }
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>

<page:applyDecorator name="main">
    <page:param name="title">Video Platform - Welcome</page:param>
    
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

        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .bg-gradient-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .feature-icon {
            transition: transform 0.3s ease;
        }

        .card:hover .feature-icon {
            transform: scale(1.1);
        }

        .stat-number {
            font-size: 3rem;
            line-height: 1;
        }

        /* Footer styles */
        footer {
            margin-top: auto;
        }
    </style>

<!-- Hero Section -->
<div class="hero-section bg-gradient-primary text-white py-5 mb-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <h1 class="display-4 fw-bold mb-4">
                    <i class="fas fa-video me-3"></i>Welcome to Video Platform
                </h1>
                <p class="lead mb-4">
                    A modern video sharing platform built with Java Servlet, JSP, Bootstrap and JPA. 
                    Share, discover, and enjoy amazing videos from creators around the world.
                </p>
                <div class="d-flex flex-wrap gap-3">
                    <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            <a class="btn btn-light btn-lg" href="<c:url value='/home'/>" role="button">
                                <i class="fas fa-home me-2"></i>Go to Dashboard
                            </a>
                            <a class="btn btn-outline-light btn-lg" href="<c:url value='/profile'/>" role="button">
                                <i class="fas fa-user me-2"></i>My Profile
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-light btn-lg" href="<c:url value='/login'/>" role="button">
                                <i class="fas fa-sign-in-alt me-2"></i>Login
                            </a>
                            <a class="btn btn-outline-light btn-lg" href="<c:url value='/register'/>" role="button">
                                <i class="fas fa-user-plus me-2"></i>Register
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="col-lg-6 text-center">
                <div class="hero-image">
                    <i class="fas fa-play-circle fa-10x opacity-75"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Features Section -->
<div class="container">
    <div class="row mb-5">
        <div class="col-12 text-center">
            <h2 class="h3 mb-4">Why Choose Our Platform?</h2>
            <p class="text-muted">Discover the features that make our video platform unique</p>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-md-4">
            <div class="card h-100 border-0 shadow-sm">
                <div class="card-body text-center p-4">
                    <div class="feature-icon bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" 
                         style="width: 60px; height: 60px;">
                        <i class="fas fa-video fa-2x"></i>
                    </div>
                    <h5 class="card-title">Watch Videos</h5>
                    <p class="card-text text-muted">
                        Discover amazing content from creators around the world. 
                        High-quality streaming with personalized recommendations.
                    </p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card h-100 border-0 shadow-sm">
                <div class="card-body text-center p-4">
                    <div class="feature-icon bg-success text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" 
                         style="width: 60px; height: 60px;">
                        <i class="fas fa-upload fa-2x"></i>
                    </div>
                    <h5 class="card-title">Upload Content</h5>
                    <p class="card-text text-muted">
                        Share your own videos and connect with your audience. 
                        Easy upload process with automatic optimization.
                    </p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card h-100 border-0 shadow-sm">
                <div class="card-body text-center p-4">
                    <div class="feature-icon bg-info text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" 
                         style="width: 60px; height: 60px;">
                        <i class="fas fa-users fa-2x"></i>
                    </div>
                    <h5 class="card-title">Join Community</h5>
                    <p class="card-text text-muted">
                        Connect with like-minded people and grow your network. 
                        Build your profile and showcase your content.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Statistics Section -->
    <div class="row g-4 mb-5">
        <div class="col-md-3 col-sm-6">
            <div class="text-center">
                <div class="stat-number text-primary fw-bold fs-1">1000+</div>
                <div class="text-muted">Videos</div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="text-center">
                <div class="stat-number text-success fw-bold fs-1">500+</div>
                <div class="text-muted">Users</div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="text-center">
                <div class="stat-number text-info fw-bold fs-1">50+</div>
                <div class="text-muted">Categories</div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="text-center">
                <div class="stat-number text-warning fw-bold fs-1">24/7</div>
                <div class="text-muted">Support</div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <c:if test="${sessionScope.user == null}">
        <div class="row">
            <div class="col-12">
                <div class="card bg-light border-0">
                    <div class="card-body text-center py-5">
                        <h3 class="card-title mb-3">Ready to Get Started?</h3>
                        <p class="card-text text-muted mb-4">
                            Join thousands of users who are already sharing and discovering amazing content.
                        </p>
                        <a href="<c:url value='/register'/>" class="btn btn-primary btn-lg me-3">
                            <i class="fas fa-user-plus me-2"></i>Create Account
                        </a>
                        <a href="<c:url value='/login'/>" class="btn btn-outline-primary btn-lg">
                            <i class="fas fa-sign-in-alt me-2"></i>Sign In
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</div>

<style>
.hero-section {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.bg-gradient-primary {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.feature-icon {
    transition: transform 0.3s ease;
}

.card:hover .feature-icon {
    transform: scale(1.1);
}

.stat-number {
    font-size: 3rem;
    line-height: 1;
}
</style>

    
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
</page:applyDecorator>
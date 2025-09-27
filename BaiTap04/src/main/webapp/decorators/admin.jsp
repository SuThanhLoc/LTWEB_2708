<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><decorator:title default="Admin Page" /></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <decorator:head />
</head>
<body>
    <!-- Top Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-video me-2"></i>Video Platform
            </a>
            <div class="navbar-nav ms-auto">
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-user me-1"></i>Administrator
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/profile">Profile</a></li>
                        <li><a class="dropdown-item" href="/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    
    <!-- Main Content Area -->
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 px-0">
                <div class="bg-light h-100">
                    <div class="p-3">
                        <h6 class="text-muted mb-3">Menu</h6>
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item mb-2">
                                <a class="nav-link active" href="/admin/home">
                                    <i class="fas fa-home me-2"></i>Home
                                </a>
                            </li>
                            <li class="nav-item mb-2">
                                <a class="nav-link" href="/profile">
                                    <i class="fas fa-user me-2"></i>Profile
                                </a>
                            </li>
                            <hr class="my-3">
                            <li class="nav-item mb-2">
                                <a class="nav-link" href="/category-management">
                                    <i class="fas fa-shield-alt me-2"></i>Management
                                </a>
                            </li>
                            <li class="nav-item mb-2">
                                <a class="nav-link" href="/admin/home">
                                    <i class="fas fa-tachometer-alt me-2"></i>Dashboard
                                </a>
                            </li>
                            <li class="nav-item mb-2">
                                <a class="nav-link" href="/admin/category/list">
                                    <i class="fas fa-tags me-2"></i>Categories
                                </a>
                            </li>
                            <li class="nav-item mb-2">
                                <a class="nav-link" href="#">
                                    <i class="fas fa-video me-2"></i>Videos
                                </a>
                            </li>
                            <li class="nav-item mb-2">
                                <a class="nav-link" href="#">
                                    <i class="fas fa-users me-2"></i>Users
                                </a>
                            </li>
                            <li class="nav-item mb-2">
                                <a class="nav-link" href="#">
                                    <i class="fas fa-info-circle me-2"></i>About
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 py-3">
                <decorator:body/>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <footer class="bg-light border-top mt-auto">
        <div class="container-fluid py-3">
            <div class="row">
                <div class="col-12 text-center">
                    <p class="mb-0 text-muted">
                        <i class="fas fa-heart text-danger me-1"></i>
                        Made with love by Video Platform Team
                    </p>
                </div>
            </div>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

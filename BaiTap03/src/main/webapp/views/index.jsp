<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .avatar-container {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            overflow: hidden;
            margin-right: 10px;
        }
        .avatar-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .video-card {
            margin-bottom: 20px;
        }
        .video-thumbnail {
            position: relative;
            padding-top: 56.25%; /* 16:9 Aspect Ratio */
        }
        .video-thumbnail img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">Video Portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/videos">Videos</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="categoriesDropdown" role="button" 
                           data-bs-toggle="dropdown">
                            Danh mục
                        </a>
                        <ul class="dropdown-menu">
                            <c:forEach items="${categories}" var="category">
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/category/${category.cateid}">
                                        ${category.catename}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </ul>
                
                <!-- Search Form -->
                <form class="d-flex mx-3" action="${pageContext.request.contextPath}/search" method="GET">
                    <input class="form-control me-2" type="search" placeholder="Tìm kiếm video..." name="q">
                    <button class="btn btn-outline-light" type="submit">Tìm</button>
                </form>

                <!-- User Menu -->
                <div class="d-flex align-items-center">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <div class="dropdown">
                                <a class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" 
                                   id="userDropdown" role="button" data-bs-toggle="dropdown">
                                    <div class="avatar-container">
                                        <img src="${empty sessionScope.user.avatar ? '/images/default-avatar.png' : sessionScope.user.avatar}" 
                                             alt="Avatar">
                                    </div>
                                    <span>${sessionScope.user.username}</span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <c:if test="${sessionScope.user.admin}">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin">Quản trị</a></li>
                                    </c:if>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile">Hồ sơ</a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/my-videos">Video của tôi</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
                                </ul>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light me-2">Đăng nhập</a>
                            <a href="${pageContext.request.contextPath}/register" class="btn btn-primary">Đăng ký</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container py-4">
        <!-- Featured Videos -->
        <h2 class="mb-4">Videos nổi bật</h2>
        <div class="row">
            <c:forEach items="${featuredVideos}" var="video">
                <div class="col-md-4 col-sm-6">
                    <div class="card video-card">
                        <div class="video-thumbnail">
                            <img src="${empty video.poster ? '/images/default-thumbnail.jpg' : video.poster}" 
                                 alt="${video.title}">
                            <span class="position-absolute bottom-0 end-0 badge bg-dark m-2">
                                ${video.views} lượt xem
                            </span>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${video.title}</h5>
                            <p class="card-text text-truncate">${video.description}</p>
                            <div class="d-flex align-items-center">
                                <div class="avatar-container" style="width: 30px; height: 30px;">
                                    <img src="${empty video.user.avatar ? '/images/default-avatar.png' : video.user.avatar}" 
                                         alt="${video.user.username}">
                                </div>
                                <small class="text-muted">${video.user.username}</small>
                            </div>
                            <a href="${pageContext.request.contextPath}/video/${video.id}" 
                               class="btn btn-primary mt-2">Xem video</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Categories -->
        <h2 class="mb-4 mt-5">Danh mục video</h2>
        <div class="row">
            <c:forEach items="${categories}" var="category">
                <div class="col-md-4 col-sm-6 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">
                                <i class="${category.icon}"></i> ${category.catename}
                            </h5>
                            <p class="card-text">
                                <small class="text-muted">${category.videoCount} videos</small>
                            </p>
                            <a href="${pageContext.request.contextPath}/category/${category.cateid}" 
                               class="btn btn-outline-primary">Xem danh mục</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>Về chúng tôi</h5>
                    <p>Nền tảng chia sẻ video dành cho mọi người</p>
                </div>
                <div class="col-md-6">
                    <h5>Liên hệ</h5>
                    <ul class="list-unstyled">
                        <li>Email: contact@example.com</li>
                        <li>Phone: (123) 456-7890</li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

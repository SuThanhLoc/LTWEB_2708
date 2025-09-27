<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Danh mục - Grid View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
        .category-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 15px;
            overflow: hidden;
        }
        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }
        .category-image {
            height: 200px;
            object-fit: cover;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .category-icon {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .category-name {
            font-size: 1.2rem;
            font-weight: 600;
            color: #2c3e50;
        }
        .category-actions {
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .category-card:hover .category-actions {
            opacity: 1;
        }
        .stats-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container-fluid py-4">
        <!-- Header -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h2 class="mb-1">Quản lý Danh mục</h2>
                        <p class="text-muted mb-0">Quản lý và tổ chức các danh mục sản phẩm</p>
                    </div>
                    <div>
                        <a href="<c:url value='/admin/category/add' />" class="btn btn-primary btn-lg">
                            <i class="fas fa-plus-circle me-2"></i>Thêm danh mục mới
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-layer-group fa-2x mb-2"></i>
                        <h4 class="mb-0">${cateList.size()}</h4>
                        <small>Tổng danh mục</small>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-images fa-2x mb-2"></i>
                        <h4 class="mb-0">
                            <c:set var="withImages" value="0" />
                            <c:forEach var="cate" items="${cateList}">
                                <c:if test="${not empty cate.icon}">
                                    <c:set var="withImages" value="${withImages + 1}" />
                                </c:if>
                            </c:forEach>
                            ${withImages}
                        </h4>
                        <small>Có ảnh</small>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-calendar fa-2x mb-2"></i>
                        <h4 class="mb-0">${cateList.size()}</h4>
                        <small>Hoạt động</small>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-chart-line fa-2x mb-2"></i>
                        <h4 class="mb-0">100%</h4>
                        <small>Hiệu suất</small>
                    </div>
                </div>
            </div>
        </div>

        <!-- View Toggle -->
        <div class="row mb-3">
            <div class="col-12">
                <div class="btn-group" role="group">
                    <a href="<c:url value='/admin/category/list' />" class="btn btn-outline-primary">
                        <i class="fas fa-list me-1"></i> Danh sách
                    </a>
                    <button type="button" class="btn btn-primary">
                        <i class="fas fa-th me-1"></i> Grid
                    </button>
                </div>
            </div>
        </div>

        <!-- Categories Grid -->
        <div class="row">
            <c:forEach var="cate" items="${cateList}">
                <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                    <div class="card category-card h-100">
                        <!-- Category Image -->
                        <div class="position-relative">
                            <c:if test="${not empty cate.icon}">
                                <c:url var="imgUrl" value="/DownloadImageController">
                                    <c:param name="fname" value="${cate.icon}" />
                                </c:url>
                                <img src="${imgUrl}" class="card-img-top category-image" alt="${cate.catename}">
                            </c:if>
                            <c:if test="${empty cate.icon}">
                                <div class="category-image d-flex align-items-center justify-content-center">
                                    <i class="fas fa-image fa-3x text-white-50"></i>
                                </div>
                            </c:if>
                            
                            <!-- Category Icon Overlay -->
                            <div class="position-absolute top-0 start-0 m-3">
                                <c:if test="${not empty cate.icon}">
                                    <img src="${imgUrl}" class="category-icon" alt="Icon">
                                </c:if>
                                <c:if test="${empty cate.icon}">
                                    <div class="category-icon bg-primary d-flex align-items-center justify-content-center">
                                        <i class="fas fa-folder text-white"></i>
                                    </div>
                                </c:if>
                            </div>
                            
                            <!-- Actions Overlay -->
                            <div class="position-absolute top-0 end-0 m-3 category-actions">
                                <div class="btn-group-vertical">
                                    <c:url var="editUrl" value="/admin/category/edit">
                                        <c:param name="id" value="${cate.cateid}" />
                                    </c:url>
                                    <a href="${editUrl}" class="btn btn-warning btn-sm mb-1" title="Chỉnh sửa">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <c:url var="deleteUrl" value="/admin/category/delete">
                                        <c:param name="id" value="${cate.cateid}" />
                                    </c:url>
                                    <a href="${deleteUrl}" class="btn btn-danger btn-sm" title="Xóa" 
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?');">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Card Body -->
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title category-name">${cate.catename}</h5>
                            <c:if test="${not empty cate.description}">
                                <p class="card-text text-muted small">${cate.description}</p>
                            </c:if>
                            
                            <div class="mt-auto">
                                <div class="d-flex justify-content-between align-items-center">
                                    <small class="text-muted">
                                        <i class="fas fa-calendar me-1"></i>
                                        <c:if test="${not empty cate.createdDate}">
                                            ${cate.createdDate}
                                        </c:if>
                                        <c:if test="${empty cate.createdDate}">
                                            Chưa có ngày tạo
                                        </c:if>
                                    </small>
                                    <span class="badge bg-primary">ID: ${cate.cateid}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Empty State -->
        <c:if test="${empty cateList}">
            <div class="row">
                <div class="col-12">
                    <div class="text-center py-5">
                        <i class="fas fa-folder-open fa-4x text-muted mb-3"></i>
                        <h4 class="text-muted">Chưa có danh mục nào</h4>
                        <p class="text-muted">Hãy thêm danh mục đầu tiên để bắt đầu quản lý</p>
                        <a href="<c:url value='/admin/category/add' />" class="btn btn-primary">
                            <i class="fas fa-plus me-2"></i>Thêm danh mục đầu tiên
                        </a>
                    </div>
                </div>
            </div>
        </c:if>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

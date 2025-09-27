<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .video-thumbnail {
            width: 120px;
            height: 68px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin">
                                <i class="fas fa-home"></i> Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/category/list">
                                <i class="fas fa-folder"></i> Danh mục
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/admin/videos">
                                <i class="fas fa-video"></i> Videos
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/users">
                                <i class="fas fa-users"></i> Người dùng
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- Main content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1>Quản lý Video</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <a href="${pageContext.request.contextPath}/admin/videos/add" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Thêm Video
                        </a>
                    </div>
                </div>

                <!-- Search and Filter -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Tìm kiếm video..." name="search">
                            <button class="btn btn-outline-primary" type="submit">Tìm</button>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <select class="form-select" name="category">
                            <option value="">Tất cả danh mục</option>
                            <c:forEach items="${categories}" var="category">
                                <option value="${category.cateid}">${category.catename}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <!-- Videos Table -->
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Thumbnail</th>
                                <th>Tiêu đề</th>
                                <th>Danh mục</th>
                                <th>Người đăng</th>
                                <th>Lượt xem</th>
                                <th>Trạng thái</th>
                                <th>Ngày tạo</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${videos}" var="video">
                                <tr>
                                    <td>${video.id}</td>
                                    <td>
                                        <img src="${empty video.poster ? '/images/default-thumbnail.jpg' : video.poster}" 
                                             class="video-thumbnail" alt="${video.title}">
                                    </td>
                                    <td>${video.title}</td>
                                    <td>${video.category.catename}</td>
                                    <td>${video.user.username}</td>
                                    <td>${video.views}</td>
                                    <td>
                                        <span class="badge bg-${video.active ? 'success' : 'danger'}">
                                            ${video.active ? 'Active' : 'Inactive'}
                                        </span>
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${video.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                    </td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="${pageContext.request.contextPath}/admin/videos/edit?id=${video.id}" 
                                               class="btn btn-sm btn-warning">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <button type="button" class="btn btn-sm btn-danger" 
                                                    onclick="deleteVideo(${video.id})"
                                                    style="margin: 0 2px;">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                            <a href="${pageContext.request.contextPath}/video/${video.id}" 
                                               class="btn btn-sm btn-info" 
                                               target="_blank">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <nav aria-label="Page navigation" class="mt-3">
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage - 1}">Previous</a>
                        </li>
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="?page=${i}">${i}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage + 1}">Next</a>
                        </li>
                    </ul>
                </nav>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function deleteVideo(id) {
            if (confirm('Bạn có chắc chắn muốn xóa video này?')) {
                fetch('${pageContext.request.contextPath}/admin/videos/delete?id=' + id, {
                    method: 'POST'
                }).then(response => {
                    if (response.ok) {
                        location.reload();
                    } else {
                        alert('Có lỗi xảy ra khi xóa video!');
                    }
                });
            }
        }
    </script>
</body>
</html>

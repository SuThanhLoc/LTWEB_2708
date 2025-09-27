<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Video Mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
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
                    <h1>Thêm Video Mới</h1>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/admin/videos/add" 
                                      method="post" enctype="multipart/form-data">
                                    
                                    <c:if test="${not empty error}">
                                        <div class="alert alert-danger">${error}</div>
                                    </c:if>

                                    <div class="mb-3">
                                        <label for="title" class="form-label">Tiêu đề video <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="title" name="title" 
                                               required value="${video.title}">
                                    </div>

                                    <div class="mb-3">
                                        <label for="description" class="form-label">Mô tả</label>
                                        <textarea class="form-control" id="description" name="description" 
                                                  rows="3">${video.description}</textarea>
                                    </div>

                                    <div class="mb-3">
                                        <label for="categoryId" class="form-label">Danh mục <span class="text-danger">*</span></label>
                                        <select class="form-select" id="categoryId" name="categoryId" required>
                                            <option value="">Chọn danh mục</option>
                                            <c:forEach items="${categories}" var="category">
                                                <option value="${category.cateid}" 
                                                    ${video.categoryId == category.cateid ? 'selected' : ''}>
                                                    ${category.catename}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="videoFile" class="form-label">File video <span class="text-danger">*</span></label>
                                        <input type="file" class="form-control" id="videoFile" name="videoFile" 
                                               accept="video/*" required>
                                        <small class="text-muted">Hỗ trợ định dạng: MP4, WebM (Max: 500MB)</small>
                                    </div>

                                    <div class="mb-3">
                                        <label for="poster" class="form-label">Ảnh thumbnail</label>
                                        <input type="file" class="form-control" id="poster" name="poster" 
                                               accept="image/*">
                                        <small class="text-muted">Kích thước khuyến nghị: 1280x720px (16:9)</small>
                                    </div>

                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input" id="active" 
                                               name="active" ${video.active ? 'checked' : ''}>
                                        <label class="form-check-label" for="active">Kích hoạt video</label>
                                    </div>

                                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                        <button type="button" class="btn btn-secondary me-md-2" 
                                                onclick="history.back()">Hủy</button>
                                        <button type="submit" class="btn btn-primary">Lưu video</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Hướng dẫn</h5>
                                <ul class="list-unstyled">
                                    <li><i class="fas fa-info-circle text-info"></i> Tiêu đề video nên ngắn gọn, dễ hiểu</li>
                                    <li><i class="fas fa-info-circle text-info"></i> Mô tả chi tiết giúp người xem hiểu rõ nội dung</li>
                                    <li><i class="fas fa-info-circle text-info"></i> Chọn thumbnail hấp dẫn để thu hút người xem</li>
                                    <li><i class="fas fa-exclamation-triangle text-warning"></i> File video không vượt quá 500MB</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Preview thumbnail image
        document.getElementById('poster').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const preview = document.createElement('img');
                    preview.src = e.target.result;
                    preview.style.maxWidth = '100%';
                    preview.style.marginTop = '10px';
                    const container = document.getElementById('poster').parentElement;
                    const oldPreview = container.querySelector('img');
                    if (oldPreview) {
                        container.removeChild(oldPreview);
                    }
                    container.appendChild(preview);
                }
                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Danh mục mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Thêm Danh mục mới</h4>
            </div>
            <div class="card-body">
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        ${error}
                    </div>
                </c:if>
            
                <%-- Form được xây dựng theo cấu trúc bạn yêu cầu --%>
                <form role="form" action="<c:url value='/admin/category/add' />" method="post" enctype="multipart/form-data">
                    
                    <%-- Tên danh mục (sử dụng mb-3 cho Bootstrap 5) --%>
                    <div class="mb-3">
                        <label for="categoryName" class="form-label"><strong>Tên danh mục:</strong></label>
                        <input id="categoryName" class="form-control" placeholder="Vui lòng nhập tên danh mục" name="name" required />
                    </div>
                    
                    <%-- Ảnh đại diện với preview --%>
                    <div class="mb-3">
                        <label for="categoryIcon" class="form-label"><strong>Ảnh đại diện:</strong></label>
                        <input id="categoryIcon" type="file" name="icon" class="form-control" accept="image/*" onchange="previewImage(this)" />
                        <div id="imagePreview" class="mt-2" style="display: none;">
                            <img id="previewImg" src="" alt="Preview" class="img-thumbnail" style="max-width: 200px; max-height: 200px;">
                        </div>
                    </div>
                    
                    <hr>
                    
                    <div class="d-flex justify-content-start">
                        <%-- Nút Thêm (btn-default -> btn-primary) --%>
                        <button type="submit" class="btn btn-primary me-2">
                             <i class="fas fa-save me-1"></i> Thêm
                        </button>
                        
                        <%-- Nút Hủy (Reset) (btn-primary -> btn-secondary) --%>
                        <button type="reset" class="btn btn-secondary">
                            <i class="fas fa-redo me-1"></i> Hủy
                        </button>

                        <a href="<c:url value='/admin/category/list'/>" class="btn btn-outline-secondary ms-auto">
                             <i class="fas fa-arrow-left me-1"></i> Quay lại danh sách
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function previewImage(input) {
            const preview = document.getElementById('imagePreview');
            const previewImg = document.getElementById('previewImg');
            
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                
                reader.onload = function(e) {
                    previewImg.src = e.target.result;
                    preview.style.display = 'block';
                }
                
                reader.readAsDataURL(input.files[0]);
            } else {
                preview.style.display = 'none';
            }
        }
    </script>
</body>
</html>
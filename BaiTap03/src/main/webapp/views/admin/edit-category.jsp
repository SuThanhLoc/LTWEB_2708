<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa Danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <div class="card shadow">
            <div class="card-header bg-warning text-dark">
                <h4 class="mb-0">Chỉnh sửa Danh mục #${category.cateid}</h4>
            </div>
            <div class="card-body">

                <%-- Tạo biến chứa URL cho action của form --%>
                <c:url value="/admin/category/edit" var="formAction" />
            
                <form role="form" action="${formAction}" method="post" enctype="multipart/form-data">
                
                    <%-- Truyền ID của category một cách ẩn đi --%>
                    <input type="hidden" name="id" value="${category.cateid}">
                    
                    <%-- Tên danh mục (sửa lại value và name cho đúng) --%>
                    <div class="mb-3">
                        <label for="categoryName" class="form-label"><strong>Tên danh mục:</strong></label>
                        <input id="categoryName" type="text" class="form-control" value="${category.catename}" name="name" required />
                    </div>
                    
                    <%-- Hiển thị ảnh đại diện hiện tại --%>
                    <div class="mb-3">
                        <label class="form-label"><strong>Ảnh hiện tại:</strong></label>
                        <div>
                            <c:if test="${not empty category.icon}">
                                <c:url var="imgUrl" value="/DownloadImageController">
                                    <c:param name="fname" value="${category.icon}" />
                                </c:url>
                                <img src="${imgUrl}" alt="Ảnh hiện tại" class="img-thumbnail" style="max-width: 150px; max-height: 150px;">
                            </c:if>
                             <c:if test="${empty category.icon}">
                                <p class="text-muted">Chưa có ảnh</p>
                            </c:if>
                        </div>
                    </div>

                    <%-- Upload ảnh mới (loại bỏ thuộc tính 'value' không hợp lệ) --%>
                    <div class="mb-3">
                        <label for="categoryIcon" class="form-label"><strong>Tải lên ảnh mới:</strong></label>
                        <input id="categoryIcon" type="file" name="icon" class="form-control" accept="image/*">
                        <div class="form-text">Để trống nếu bạn không muốn thay đổi ảnh hiện tại.</div>
                    </div>
                    
                    <hr>
                    
                    <div class="d-flex justify-content-start">
                        <%-- Nút Cập nhật (btn-default -> btn-primary) --%>
                        <button type="submit" class="btn btn-primary me-2">
                             <i class="fas fa-save me-1"></i> Cập nhật
                        </button>
                        
                        <%-- Nút Quay lại (thay cho Reset để UX tốt hơn) --%>
                        <a href="<c:url value='/admin/category/list'/>" class="btn btn-secondary">
                             <i class="fas fa-arrow-left me-1"></i> Quay lại
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
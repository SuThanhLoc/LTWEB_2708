<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <div class="card shadow">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Danh sách Danh mục</h4>
                <div class="d-flex gap-2">
                    <a href="<c:url value='/admin/category/grid' />" class="btn btn-outline-light btn-sm">
                        <i class="fas fa-th me-1"></i>Grid View
                    </a>
                    <a href="<c:url value='/admin/category/add' />" class="btn btn-light">
                        <i class="fas fa-plus-circle me-2"></i>Thêm mới
                    </a>
                </div>
            </div>
            <div class="card-body">
                <c:if test="${not empty param.error}">
                    <div class="alert alert-danger" role="alert">
                        Có lỗi xảy ra, vui lòng thử lại!
                    </div>
                </c:if>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle">
                        <thead class="table-light text-center">
                            <tr>
                                <th scope="col" style="width: 70px;">STT</th>
                                <th scope="col" style="width: 120px;">Icon</th>
                                <th scope="col">Tên Danh mục</th>
                                <th scope="col" style="width: 150px;">Hành động</th>
                            </tr>
                        </thead>
                        <tbody class="text-center">
                            <%-- Bắt đầu vòng lặp, sử dụng varStatus để lấy số thứ tự --%>
                            <c:forEach var="cate" items="${cateList}" varStatus="loop">
                                <tr>
                                    <%-- Hiển thị số thứ tự, loop.count bắt đầu từ 1 --%>
                                    <th scope="row">${loop.count}</th>
                                    
                                    <td>
                                        <c:if test="${not empty cate.icon}">
                                            <%-- Tạo URL an toàn cho hình ảnh bằng thẻ c:url --%>
                                            <c:url var="imgUrl" value="/DownloadImageController">
                                                <c:param name="fname" value="${cate.icon}" />
                                            </c:url>
                                            <img src="${imgUrl}" alt="Icon" class="img-thumbnail" 
                                                 style="width: 80px; height: 80px; object-fit: cover;">
                                        </c:if>
                                        <c:if test="${empty cate.icon}">
                                            <span class="text-muted">Không có ảnh</span>
                                        </c:if>
                                    </td>
                                    
                                    <%-- Hiển thị tên danh mục --%>
                                    <td class="text-start">${cate.catename}</td>
                                    
                                    <td>
                                        <%-- Tạo URL an toàn cho nút Sửa --%>
                                        <c:url var="editUrl" value="/admin/category/edit">
                                            <c:param name="id" value="${cate.cateid}" />
                                        </c:url>
                                        <a href="${editUrl}" class="btn btn-warning btn-sm" title="Sửa">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        
                                        <%-- Tạo URL an toàn cho nút Xóa --%>
                                        <c:url var="deleteUrl" value="/admin/category/delete">
                                             <c:param name="id" value="${cate.cateid}" />
                                        </c:url>
                                        <a href="${deleteUrl}" class="btn btn-danger btn-sm" title="Xóa" 
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?');">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
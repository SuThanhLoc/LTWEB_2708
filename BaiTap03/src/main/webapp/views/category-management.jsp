<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management - Video Platform</title>
    
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

        /* Form Styles */
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.25);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        /* Footer styles */
        footer {
            margin-top: auto;
        }

        /* Category Management Styles */
        .category-item {
            border: 1px solid #dee2e6;
            border-radius: 0.375rem;
            padding: 1rem;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }

        .category-item:hover {
            border-color: var(--primary-color);
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .category-actions {
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .category-item:hover .category-actions {
            opacity: 1;
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
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <h2 class="h3 mb-0">
                                        <i class="fas fa-tags me-2"></i>Category Management
                                    </h2>
                                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
                                        <i class="fas fa-plus me-2"></i>Add New Category
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Alert Messages -->
                        <c:if test="${not empty success}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle me-2"></i>${success}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                        
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${error}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>

                        <!-- Categories List -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0">
                                            <i class="fas fa-list me-2"></i>Categories List
                                        </h5>
                                    </div>
                                    <div class="card-body">
                                        <c:choose>
                                            <c:when test="${not empty categories}">
                                                <div class="row">
                                                    <c:forEach var="category" items="${categories}">
                                                        <div class="col-md-6 col-lg-4 mb-3">
                                                            <div class="category-item">
                                                                <div class="d-flex justify-content-between align-items-start">
                                                                    <div class="flex-grow-1">
                                                                        <div class="d-flex align-items-center mb-2">
                                                                            <c:if test="${not empty category.icon}">
                                                                                <c:url var="imgUrl" value="/download-image">
                                                                                    <c:param name="fname" value="${category.icon}" />
                                                                                </c:url>
                                                                                <img src="${imgUrl}" alt="Icon" class="img-thumbnail me-2" 
                                                                                     style="width: 40px; height: 40px; object-fit: cover;">
                                                                            </c:if>
                                                                            <c:if test="${empty category.icon}">
                                                                                <div class="bg-light rounded me-2 d-flex align-items-center justify-content-center" 
                                                                                     style="width: 40px; height: 40px;">
                                                                                    <i class="fas fa-image text-muted"></i>
                                                                                </div>
                                                                            </c:if>
                                                                            <h6 class="mb-0">${category.catename}</h6>
                                                                        </div>
                                                                        <p class="text-muted mb-2 small">${category.description}</p>
                                                                        <small class="text-muted">
                                                                            <i class="fas fa-calendar me-1"></i>
                                                                            Created: <fmt:formatDate value="${category.createdDate}" pattern="MMM dd, yyyy"/>
                                                                        </small>
                                                                    </div>
                                                                    <div class="category-actions">
                                                                        <div class="btn-group btn-group-sm">
                                                                            <button class="btn btn-outline-primary" 
                                                                                    data-category-id="${category.cateid}"
                                                                                    data-category-name="${category.catename}"
                                                                                    data-category-description="${category.description}"
                                                                                    onclick="editCategoryFromData(this)"
                                                                                    title="Edit">
                                                                                <i class="fas fa-edit"></i>
                                                                            </button>
                                                                            <button class="btn btn-outline-danger" 
                                                                                    data-category-id="${category.cateid}"
                                                                                    data-category-name="${category.catename}"
                                                                                    onclick="deleteCategoryFromData(this)"
                                                                                    title="Delete">
                                                                                <i class="fas fa-trash"></i>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="text-center py-5">
                                                    <i class="fas fa-tags fa-3x text-muted mb-3"></i>
                                                    <h5 class="text-muted">No categories found</h5>
                                                    <p class="text-muted">Start by adding your first category.</p>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>
    
    <!-- Add Category Modal -->
    <div class="modal fade" id="addCategoryModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        <i class="fas fa-plus me-2"></i>Add New Category
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="<c:url value='/category-management'/>" method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                        <input type="hidden" name="action" value="add">
                        
                        <div class="mb-3">
                            <label for="addName" class="form-label">
                                <i class="fas fa-tag me-1"></i>Category Name *
                            </label>
                            <input type="text" class="form-control" id="addName" name="name" required>
                            <div class="invalid-feedback">
                                Please provide a category name.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="addDescription" class="form-label">
                                <i class="fas fa-align-left me-1"></i>Description
                            </label>
                            <textarea class="form-control" id="addDescription" name="description" rows="3"></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="addIcon" class="form-label">
                                <i class="fas fa-image me-1"></i>Category Icon
                            </label>
                            <input type="file" class="form-control" id="addIcon" name="icon" accept="image/*" onchange="previewImage(this, 'addPreview')">
                            <div id="addPreview" class="mt-2" style="display: none;">
                                <img id="addPreviewImg" src="" alt="Preview" class="img-thumbnail" style="max-width: 200px; max-height: 200px;">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save me-2"></i>Add Category
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Category Modal -->
    <div class="modal fade" id="editCategoryModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        <i class="fas fa-edit me-2"></i>Edit Category
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="<c:url value='/category-management'/>" method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" name="id" id="editId">
                        
                        <div class="mb-3">
                            <label for="editName" class="form-label">
                                <i class="fas fa-tag me-1"></i>Category Name *
                            </label>
                            <input type="text" class="form-control" id="editName" name="name" required>
                            <div class="invalid-feedback">
                                Please provide a category name.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="editDescription" class="form-label">
                                <i class="fas fa-align-left me-1"></i>Description
                            </label>
                            <textarea class="form-control" id="editDescription" name="description" rows="3"></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="editIcon" class="form-label">
                                <i class="fas fa-image me-1"></i>Category Icon
                            </label>
                            <input type="file" class="form-control" id="editIcon" name="icon" accept="image/*" onchange="previewImage(this, 'editPreview')">
                            <div id="editPreview" class="mt-2" style="display: none;">
                                <img id="editPreviewImg" src="" alt="Preview" class="img-thumbnail" style="max-width: 200px; max-height: 200px;">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save me-2"></i>Update Category
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Delete Category Modal -->
    <div class="modal fade" id="deleteCategoryModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        <i class="fas fa-trash me-2"></i>Delete Category
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="<c:url value='/category-management'/>" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" id="deleteId">
                        
                        <div class="text-center">
                            <i class="fas fa-exclamation-triangle fa-3x text-warning mb-3"></i>
                            <h5>Are you sure?</h5>
                            <p class="text-muted">You are about to delete the category: <strong id="deleteName"></strong></p>
                            <p class="text-danger small">This action cannot be undone.</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger">
                            <i class="fas fa-trash me-2"></i>Delete Category
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <%@include file="/common/footer.jsp" %>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Form validation - REMOVED to prevent blocking form submission

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

        // Edit category function
        function editCategory(id, name, description) {
            document.getElementById('editId').value = id;
            document.getElementById('editName').value = name;
            document.getElementById('editDescription').value = description;
            
            const editModal = new bootstrap.Modal(document.getElementById('editCategoryModal'));
            editModal.show();
        }

        // Edit category function from data attributes
        function editCategoryFromData(button) {
            const id = button.getAttribute('data-category-id');
            const name = button.getAttribute('data-category-name');
            const description = button.getAttribute('data-category-description');
            
            document.getElementById('editId').value = id;
            document.getElementById('editName').value = name;
            document.getElementById('editDescription').value = description;
            
            const editModal = new bootstrap.Modal(document.getElementById('editCategoryModal'));
            editModal.show();
        }

        // Delete category function
        function deleteCategory(id, name) {
            document.getElementById('deleteId').value = id;
            document.getElementById('deleteName').textContent = name;
            
            const deleteModal = new bootstrap.Modal(document.getElementById('deleteCategoryModal'));
            deleteModal.show();
        }

        // Delete category function from data attributes
        function deleteCategoryFromData(button) {
            const id = button.getAttribute('data-category-id');
            const name = button.getAttribute('data-category-name');
            
            document.getElementById('deleteId').value = id;
            document.getElementById('deleteName').textContent = name;
            
            const deleteModal = new bootstrap.Modal(document.getElementById('deleteCategoryModal'));
            deleteModal.show();
        }

        // Loading states for buttons - REMOVED to prevent infinite loading
        // The form will submit naturally without JavaScript interference

        // Image preview function
        function previewImage(input, previewId) {
            try {
                const preview = document.getElementById(previewId);
                const previewImg = document.getElementById(previewId + 'Img');
                
                if (!preview || !previewImg) {
                    console.error('Preview elements not found:', previewId);
                    return;
                }
                
                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    
                    reader.onload = function(e) {
                        previewImg.src = e.target.result;
                        preview.style.display = 'block';
                    }
                    
                    reader.onerror = function() {
                        console.error('Error reading file');
                    }
                    
                    reader.readAsDataURL(input.files[0]);
                } else {
                    preview.style.display = 'none';
                }
            } catch (error) {
                console.error('Error in previewImage:', error);
            }
        }
    </script>
</body>
</html>

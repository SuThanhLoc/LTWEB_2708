<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Upload Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">Upload Video</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" action="video-upload" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="title" class="form-label">Title</label>
                                <input type="text" class="form-control" id="title" name="title" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                            </div>
                            
                            <div class="mb-3">
                                <label for="poster" class="form-label">Poster Image</label>
                                <input type="file" class="form-control" id="poster" name="poster" accept="image/*">
                            </div>
                            
                            <div class="mb-3">
                                <label for="video" class="form-label">Video File</label>
                                <input type="file" class="form-control" id="video" name="video" accept="video/*" required>
                            </div>
                            
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Upload Video</button>
                            </div>
                        </form>
                    </div>
                </div>
                
                <% if (request.getAttribute("message") != null) { %>
                <div class="alert alert-info mt-3" role="alert">
                    <%= request.getAttribute("message") %>
                </div>
                <% } %>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

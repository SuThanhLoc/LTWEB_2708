<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật hồ sơ</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="container mt-4">
		<div class="card shadow-sm">
			<div class="card-header bg-warning text-dark">
				<h4 class="mb-0">Cập nhật hồ sơ</h4>
			</div>
			<div class="card-body">
				<form action="${pageContext.request.contextPath}/updateProfile"
					method="post" enctype="multipart/form-data">

					<!-- Họ và tên -->
					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label fw-bold">Họ và tên</label>
						<div class="col-sm-9">
							<input type="text" name="fullname" value="${fullname}"
								class="form-control" placeholder="Nhập họ tên...">
						</div>
					</div>

					<!-- Số điện thoại -->
					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label fw-bold">Số điện
							thoại</label>
						<div class="col-sm-9">
							<input type="text" name="phone" value="${phone}"
								class="form-control" placeholder="Nhập số điện thoại...">
						</div>
					</div>

					<!-- Ảnh đại diện -->
					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label fw-bold">Ảnh đại
							diện</label>
						<div class="col-sm-9">
							<c:choose>
								<c:when test="${not empty avatarUrl}">
									<img src="${avatarUrl}" alt="Avatar" class="img-thumbnail mb-2"
										style="max-width: 150px; height: auto; object-fit: cover;"
										onerror="this.src='https://via.placeholder.com/150?text=No+Image';">
								</c:when>
								<c:otherwise>
									<img src="https://via.placeholder.com/150?text=No+Image"
										class="img-thumbnail mb-2" alt="No Image">
								</c:otherwise>
							</c:choose>

							<input type="file" name="avatar" class="form-control"> <small
								class="text-muted">Chọn ảnh mới (jpg/png) để thay đổi
								ảnh đại diện.</small>
						</div>
					</div>

					<!-- Nút lưu -->
					<div class="text-end">
						<button type="submit" class="btn btn-success">Lưu thay
							đổi</button>
						<a href="${pageContext.request.contextPath}/profile"
							class="btn btn-secondary">Hủy</a>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>

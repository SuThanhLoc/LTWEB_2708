<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container mt-4">
	<div class="card shadow-sm">
		<div class="card-header bg-primary text-white">
			<h4 class="mb-0">Hồ sơ cá nhân</h4>
		</div>
		<div class="card-body">
			<div class="row mb-3">
				<div class="col-sm-3 fw-bold">Họ và tên</div>
				<div class="col-sm-9">${fullname != null ? fullname : "Chưa cập nhật"}</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3 fw-bold">Số điện thoại</div>
				<div class="col-sm-9">${phone != null ? phone : "Chưa cập nhật"}</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3 fw-bold">Ảnh đại diện</div>
				<div class="col-sm-9">
					<img src="${avatarUrl}" alt="Avatar"
					     class="img-thumbnail"
					     style="max-width: 150px; height: auto; object-fit: cover;"
					     onerror="this.src='https://via.placeholder.com/150?text=No+Image';">
				</div>
			</div>
		</div>
	</div>
</div>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap JS (cần cho các component như modal, dropdown, carousel...) -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<%
    request.setAttribute("title", "Hồ sơ cá nhân");

    // Ví dụ: lấy dữ liệu từ session (do LoginController hoặc ProfileController set)
    String fullname = (String) session.getAttribute("fullname");
    String phone = (String) session.getAttribute("phone");
    String image = (String) session.getAttribute("image"); // đường dẫn ảnh
%>

<div class="container mt-4">
  <div class="card shadow-sm">
    <div class="card-header bg-primary text-white">
      <h4 class="mb-0">Hồ sơ cá nhân</h4>
    </div>
    <div class="card-body">
      <div class="row mb-3">
        <div class="col-sm-3 fw-bold">Họ và tên</div>
        <div class="col-sm-9"><%= fullname != null ? fullname : "Chưa cập nhật" %></div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-3 fw-bold">Số điện thoại</div>
        <div class="col-sm-9"><%= phone != null ? phone : "Chưa cập nhật" %></div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-3 fw-bold">Ảnh đại diện</div>
        <div class="col-sm-9">
          <% if (image != null) { %>
            <img src="<%= image %>" alt="Avatar" class="img-thumbnail" style="max-width:150px;">
          <% } else { %>
            <span class="text-muted">Chưa có ảnh</span>
          <% } %>
        </div>
      </div>
    </div>
  </div>
</div>

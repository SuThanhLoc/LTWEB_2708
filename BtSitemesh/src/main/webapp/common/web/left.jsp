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
<div class="list-group shadow-sm">
    <a href="${pageContext.request.contextPath}/profile" 
       class="list-group-item list-group-item-action">
       👤 Thông tin cá nhân
    </a>
    <a href="${pageContext.request.contextPath}/setting" 
       class="list-group-item list-group-item-action">
       ⚙️ Cài đặt
    </a>
</div>

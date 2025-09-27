<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="vi">
<head>
<meta charset="utf-8">
<title>${sitemeshPage.title}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap (CDN) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/custom.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>
</head>
<body class="bg-body-tertiary">
	<div class="container-fluid px-0">
		<!-- Header -->
		<header class="bg-primary text-white p-3">
			<%@ include file="/common/web/header.jsp"%>
		</header>

		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<%@ include file="/common/web/navbar.jsp"%>
		</nav>

		<!-- Topbar -->
		<div class="bg-light p-2 border-bottom">
			<%@ include file="/common/web/topbar.jsp"%>
		</div>

		<!-- Main layout -->
		<div class="container my-3">
			<div class="row g-3">
				<aside class="col-lg-3">
					<%@ include file="/common/web/left.jsp"%>
				</aside>
				<!-- Nội dung body -->
				<main class="col-lg-9">
					<sitemesh:write property="body" />
				</main>

			</div>
		</div>

		<!-- Footer -->
		<footer class="bg-secondary text-white text-center p-3 mt-3">
			<%@ include file="/common/web/footer.jsp"%>
		</footer>
	</div>
</body>
</html>

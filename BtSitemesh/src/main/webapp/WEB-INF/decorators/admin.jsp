<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <title>${sitemeshPage.title}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid px-0">
  <header class="bg-dark text-white p-3">
    <%@ include file="/common/admin/header.jsp" %>
  </header>

  <div class="row g-0">
    <aside class="col-md-2 bg-light border-end p-3 min-vh-100">
      <%@ include file="/common/admin/left.jsp" %>
    </aside>
    <main class="col-md-10 p-4">
      ${sitemeshPage.body}
    </main>
  </div>

  <footer class="bg-dark text-white text-center p-3">
    <%@ include file="/common/admin/footer.jsp" %>
  </footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

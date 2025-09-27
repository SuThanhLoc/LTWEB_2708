<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setAttribute("title", "Đăng nhập");
%>
<form method="post" action="${pageContext.request.contextPath}/doLogin">
  <div class="mb-3">
    <label class="form-label">Tên đăng nhập</label>
    <input type="text" name="username" class="form-control" required>
  </div>
  <div class="mb-3">
    <label class="form-label">Mật khẩu</label>
    <input type="password" name="password" class="form-control" required>
  </div>
  <button class="btn btn-primary w-100">Đăng nhập</button>
</form>

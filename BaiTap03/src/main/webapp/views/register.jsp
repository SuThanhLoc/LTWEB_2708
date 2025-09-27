<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Ký Tài Khoản</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
    padding: 20px 0;
}

.register-container {
    width: 500px;
    background-color: #fff;
    padding: 40px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.register-container h2 {
    margin-top: 0;
    margin-bottom: 30px;
    font-size: 24px;
    color: #333;
}

.input-group {
    margin-bottom: 20px;
    position: relative;
}

.input-group input {
    width: 100%;
    padding: 12px 12px 12px 40px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
}

.input-group .icon {
    position: absolute;
    left: 10px;
    top: 50%;
    transform: translateY(-50%);
    color: #aaa;
    font-size: 18px;
}

.register-button {
    width: 100%;
    padding: 12px;
    background-color: #28a745;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 18px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.register-button:hover {
    background-color: #218838;
}

.login-link {
    margin-top: 20px;
    font-size: 14px;
    color: #666;
}

.login-link a {
    color: #007bff;
    text-decoration: none;
}
</style>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

    <div class="register-container">
        <h2>ĐĂNG KÝ TÀI KHOẢN</h2>

        <%
        String alert = (String) request.getAttribute("alert");
        if (alert != null) {
        %>
        <p style="color: red"><%=alert%></p>
        <%
        }
        %>

        <form action="register" method="post">
            <div class="input-group">
                <span class="icon"><i class="fas fa-user-circle"></i></span> 
                <input type="text" name="fullname" placeholder="Họ và tên" required>
            </div>
            <div class="input-group">
                <span class="icon"><i class="fas fa-user"></i></span> 
                <input type="text" name="username" placeholder="Tên đăng nhập" required>
            </div>
             <div class="input-group">
                <span class="icon"><i class="fas fa-envelope"></i></span> 
                <input type="email" name="email" placeholder="Email" required>
            </div>
             <div class="input-group">
                <span class="icon"><i class="fas fa-phone"></i></span> 
                <input type="text" name="phone" placeholder="Số điện thoại" required>
            </div>
            <div class="input-group">
                <span class="icon"><i class="fas fa-lock"></i></span> 
                <input type="password" name="password" placeholder="Mật khẩu" required>
            </div>
             <div class="input-group">
                <span class="icon"><i class="fas fa-check-circle"></i></span> 
                <input type="password" name="confirm-password" placeholder="Xác nhận mật khẩu" required>
            </div>

            <button type="submit" class="register-button">Đăng ký</button>
        </form>
        
        <div class="login-link">
            <p>Đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>
        </div>
    </div>

</body>
</html>
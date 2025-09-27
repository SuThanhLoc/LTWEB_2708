<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Nhập</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.login-container {
	width: 400px;
	background-color: #fff;
	padding: 40px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.login-container h2 {
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

.options-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
	font-size: 14px;
}

.remember-me {
	display: flex;
	align-items: center;
	color: #666;
}

.remember-me input {
	margin-right: 8px;
}

.forgot-password a {
	color: #007bff;
	text-decoration: none;
}

.login-button {
	width: 100%;
	padding: 12px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	font-size: 18px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.login-button:hover {
	background-color: #0056b3;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

	<div class="login-container">
		<h2>ĐĂNG NHẬP</h2>
		<form action="/BtSitemesh/login" method="post">
			<div class="input-group">
				<span class="icon"><i class="fas fa-user"></i></span> <input
					type="text" name="username" placeholder="">
			</div>
			<div class="input-group">
				<span class="icon"><i class="fas fa-lock"></i></span> <input
					type="password" name="password" placeholder="">
			</div>
			<div class="options-container">
				<div class="remember-me">
					<input type="checkbox" id="remember-me" name="remember-me">
					<label for="remember-me">Nhớ tôi</label>
				</div>
				<div class="forgot-password">
					<a href="LoginForgetPass.jsp">Quên mật khẩu?</a>
				</div>
			</div>
			<button type="submit" class="login-button">Đăng nhập</button>
		</form>
	</div>

</body>
</html>
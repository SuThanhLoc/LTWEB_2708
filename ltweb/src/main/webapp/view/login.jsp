<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modern Login Form</title>
<style>
/* CSS Reset and Font Import */
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* Body Styling with Gradient Background */
body {
	font-family: 'Poppins', sans-serif;
	background: linear-gradient(135deg, #667eea, #764ba2);
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	color: #333;
}

/* Login Container Styling */
.login-container {
	background-color: rgba(255, 255, 255, 0.95);
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
	width: 100%;
	max-width: 400px;
	text-align: center;
	/* Animation on load */
	animation: fadeIn 1s ease-in-out;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(-20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
h2 {
	margin-bottom: 25px;
	font-weight: 600;
	color: #333;
}

/* Form Group Styling */
.form-group {
	margin-bottom: 20px;
	text-align: left;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	font-weight: 400;
	color: #555;
}

/* Input Field Styling & Effects */
.form-group input {
	width: 100%;
	padding: 12px 15px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 16px;
	font-family: 'Poppins', sans-serif;
	transition: border-color 0.3s, box-shadow 0.3s;
}

.form-group input:focus {
	outline: none;
	border-color: #667eea;
	box-shadow: 0 0 8px rgba(102, 126, 234, 0.5);
}

/* Button Styling & Effects */
.btn {
	width: 100%;
	padding: 12px;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: background-color 0.3s, transform 0.2s, box-shadow 0.3s;
}

.btn-login {
	background-color: #667eea;
	color: white;
	margin-bottom: 15px;
}

.btn-login:hover {
	background-color: #5a6ed8;
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
}

/* Error Message Styling */
.error-message {
	color: #d9534f;
	background-color: #f2dede;
	border: 1px solid #ebccd1;
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 20px;
	font-size: 14px;
}

/* Footer links */
.form-footer {
	margin-top: 20px;
	font-size: 14px;
}

.form-footer a {
	color: #667eea;
	text-decoration: none;
}

.form-footer a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="login-container">
		<h2>Login to Your Account</h2>

		<c:if test="${alert !=null}">
			<h3 class="alert alertdanger">${alert}</h3>
		</c:if>

		<form action="/ltweb/login" method="post">

			<div class="form-group">
				<label for="username">Username</label> <input type="text"
					id="username" name="username"
					value="${fn:escapeXml(param.username)}" required>
			</div>

			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					id="password" name="password" required>
			</div>

			<button type="submit" class="btn btn-login">Login</button>

			<div class="form-footer">
				<a href="#">Forgot Password?</a>
			</div>
		</form>
	</div>
</body>
</html>
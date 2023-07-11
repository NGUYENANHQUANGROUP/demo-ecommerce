<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Electro - HTML Ecommerce Template</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="/user/css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="/user/css/slick.css" />
<link type="text/css" rel="stylesheet" href="/user/css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="/user/css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="/user/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="/user/css/style.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>
<body>
	<!-- HEADER -->
	<%@include file="Header.jsp"%>
	<!-- /HEADER -->


	<div class="container" style="margin-top: 10px;">
		<div class="row"
			style="border: 1px darkgrey solid; border-radius: 10px; width: 50%; margin: 0 auto; padding: 20px;">
			<div class="col-sm-12">
				<h2>Register Account</h2>
				<hr style="border-color: #D10024; border-width: 2px;">
				<form:form action="/account/register" modelAttribute="ACCOUNT"
					enctype="multipart/form-data" method="post">
					<div class="form-group">
						<label>UserName</label>
						<form:input type="text" class="form-control" path="username"
							placeholder="Enter UserName" />
						<form:errors path="username" style="color: red"></form:errors>
						<p style="color: red">${ERR_USER}</p>
					</div>
					<div class="form-group">
						<label>Password:</label>
						<form:input type="password" class="form-control" path="password"
							placeholder="Enter password" />
						<form:errors path="password" style="color: red"></form:errors>
					</div>
					<div class="form-group">
						<label>Confirm Password:</label>
						<input type="password" class="form-control" name="confirmPassword"
							placeholder="Confirm password" />
					</div>
					<div class="form-group">
						<label>FullName</label>
						<form:input type="text" class="form-control" path="fullname"
							placeholder="Enter fullname" />
						<form:errors path="fullname" style="color: red"></form:errors>
					</div>
					<div class="form-group">
						<label>Email</label>
						<form:input type="text" class="form-control" path="email"
							placeholder="Enter email" />
						<form:errors path="email" style="color: red"></form:errors>
					</div>
					<div class="form-group">
						<label>Photo</label> <input type="file" class="form-control"
							name="image" placeholder="Select photo" />
						<p style="color: red">${ERR_IMAGE}</p>
					</div>
					<hr style="border-color: #D10024; border-width: 2px;">
					<form:button type="submit" class="btn btn-primary">Register</form:button>
					<form:button type="reset" class="btn btn-primary">Cancel</form:button>
					<button type="button" class="btn btn-primary">Login</button>
				</form:form>
			</div>
		</div>
	</div>



	<!-- FOOTER -->
	<%@include file="Footer.jsp"%>
	<!-- /FOOTER -->


	<!-- jQuery Plugins -->
	<script src="/user/js/jquery.min.js"></script>
	<script src="/user/js/bootstrap.min.js"></script>
	<script src="/user/js/slick.min.js"></script>
	<script src="/user/js/nouislider.min.js"></script>
	<script src="/user/js/jquery.zoom.min.js"></script>
	<script src="/user/js/main.js"></script>

</body>
</html>








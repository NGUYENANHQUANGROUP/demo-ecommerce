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
	<%@include file="user/Header.jsp"%>
	<!-- /HEADER -->
	
	<div class="container">

		<div class="row" style="margin-top:20px">
		    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form action="login" method="post">
					<fieldset>
						<h2>Please Login</h2>
						<hr style="border-color: #D10024; border-width: 2px;">
						<div class="form-group">
		                    <input type="text"  class="form-control input-lg" placeholder="Enter Username" name="username" value="${USERNAME}">
						</div>
						<div class="form-group">
		                    <input class="form-control input-lg" type="password"
				placeholder="Enter Password" name="password" value="${PASSWORD}">
						</div>
						<span class="button-checkbox">
							<input class="form-check-input" type="checkbox" name="remember">  Remember me? 
							<a href="" class="btn btn-link pull-right">Forgot Password?</a>
						</span>
						<p style="color: red">${MESSAGE}</p>
						<hr style="border-color: #D10024; border-width: 2px;">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
		                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Login">
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<a href="/account/register" class="btn btn-lg btn-primary btn-block">Register</a>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>





	<!-- FOOTER -->
	<%@include file="user/Footer.jsp"%>
	<!-- /FOOTER -->


	<!-- Modal Dang ký-->
	<div class="modal fade" id="ModalSignup" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog" style="width: 1000px;">
			<div class="modal-content" style="padding: 40px;">
				<div class="row">
					<div class="col-md-4 register-left">
						<h3>Welcome</h3>
						<img style="width: 100%;" src="img/product05.png" alt="">
					</div>
					<div class="col-md-8">
						<h3 style="margin-bottom: 30px;">Đăng Ký Thành Viên</h3>
						<form name="frmDangky" class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Username *" ng-model="student.username"
										ng-required="true">
								</div>
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Full Name *" ng-model="student.fullname"
										ng-required="true">
								</div>
								<div class="form-group">
									<input type="password" class="form-control"
										placeholder="Password *" ng-model="student.password"
										ng-required="true">
								</div>
								<div class="form-group">
									<input type="password" class="form-control"
										placeholder="Confirm Password *" ng-model="confirmpassword"
										ng-required="true">
								</div>

							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="email" class="form-control"
										placeholder="Your Email *" ng-model="student.email"
										ng-required="true">
								</div>
								<div class="form-group">
									<input type="text" minlength="10" maxlength="10"
										name="txtEmpPhone" class="form-control"
										placeholder="Your Phone *">
								</div>
								<div class="form-group">
									<input type="text" id="birthdate" name="birthdate"
										class="form-control" placeholder="Birthdate *"
										ng-model="student.birthday" ng-required="true">
								</div>
								<div class="form-group">
									<label style="padding: 10px;"> <input type="radio"
										name="gender" value="true" ng-model="student.gender" checked>
										<span> Male </span>
									</label> <label style="padding: 10px;"> <input type="radio"
										name="gender" value="false" ng-model="student.gender">
										<span>Female </span>
									</label>
								</div>
								<button id="btnDk" class="btn btn-success">Signup</button>
								<button id="btnDk" class="btn btn-danger" data-dismiss="modal">Cancel</button>
							</div>
						</form>
					</div>
				</div>



			</div>
		</div>

	</div>
	<!-- jQuery Plugins -->
	<script src="/user/js/jquery.min.js"></script>
	<script src="/user/js/bootstrap.min.js"></script>
	<script src="/user/js/slick.min.js"></script>
	<script src="/user/js/nouislider.min.js"></script>
	<script src="/user/js/jquery.zoom.min.js"></script>
	<script src="/user/js/main.js"></script>

</body>
</html>


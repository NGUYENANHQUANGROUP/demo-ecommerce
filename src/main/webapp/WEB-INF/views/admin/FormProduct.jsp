<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>DarkPan - Bootstrap 5 Admin Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>

<body>

	<!-- Sidebar Start -->
	<%@include file="Sidebar.jsp"%>
	<!-- Sidebar End -->
	<!-- Sidebar Start -->
	<%@include file="Navbar.jsp"%>
	<!-- Sidebar End -->





	<div class="content">
		<div class="container-fluid pt-4 px-4">
			<div class="bg-secondary rounded h-100 p-5">
				<div>
					<h6 class="mb-4">Basic Form</h6>
					<form>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">ID
								</label> <input type="email" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp">
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Name</label>
							<input type="password" class="form-control"
								id="exampleInputPassword1">
						</div>
						 <div class="mb-3">
                                <label for="formFile" class="form-label">Image</label>
                                <input class="form-control bg-dark" type="file" id="formFile">
                            </div>
                         <div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Price
								</label> <input type="number" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp">
						</div>
						 <div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Create Date
								</label> <input type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp">
						</div>
						 <div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Category ID
								</label> <input type="number" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp">
						</div>
						<div class="mb-3 form-check">
							<input type="checkbox" class="form-check-input"
								id="exampleCheck1"> <label class="form-check-label"
								for="exampleCheck1">Available</label>
						</div>
						<button type="submit" class="btn btn-success">Submit</button>
						<button type="reset" class="btn btn-primary">Cancel</button>
						<button type="submit" class="btn btn-info">Display Products</button>
					</form>
				</div>
			</div>
		</div>
	</div>








	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/chart/chart.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/tempusdominus/js/moment.min.js"></script>
	<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>

</html>
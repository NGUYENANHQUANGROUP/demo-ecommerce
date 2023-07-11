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
			<div class="bg-secondary text-center rounded p-4 mb-2">
				<form class="d-none d-md-flex ">
					<input class="form-control bg-dark border-0" type="search"
						placeholder="Search">
				</form>
			</div>
			<div class="bg-secondary text-center rounded p-4 mb-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h6 class="mb-0">Danh Sách Sản Phẩm</h6>
					<div>
						<a class="btn btn-lg btn-success" href="">Excel</a></td>
						<a class="btn btn-lg btn-success" href="/admin/formProduct">+</a></td>
					</div>
				</div>
				<div class="table-responsive">
					<table
						class="table text-start align-middle table-bordered table-hover mb-0">
						<thead>
							<tr class="text-white">
								<th><input class="form-check-input" type="checkbox"></th>
								<th>Image</th>
								<th><a href="/admin/product?field=id">ID</a></th>
								<th><a href="/admin/product?field=name">Name</a></th>

								<th><a href="/admin/product?field=price">Price</a></th>
								<th><a href="/admin/product?field=createDate">Create Date</a></th>
								<th>Category</th>
								<th>Available</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p" items="${PRODUCTS.content }">
								<tr>
									<td><input class="form-check-input" type="checkbox"></td>
									<td><img src="/img/${p.image }" width="72" height="48"
										alt="" /></td>
									<td>${p.id }</td>
									<td>${p.name }</td>
									<td>${p.price }</td>
									<td>${p.createDate }</td>
									<td>${p.category.name }</td>
									<td><input class="form-check-input" type="checkbox"></td>
									<td><a class="btn btn-sm btn-primary m-2" href="/admin/product/delete/${p.id }">Remove</a>
										<a class="btn btn-sm btn-success m-2" href="">Edit</a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<div class="btn-toolbar justify-content-between m-2" role="toolbar">
						<ul class="list-group list-group-flush">
							<li class="list-group-item bg-transparent">Total products: ${PRODUCTS.totalElements}</li>
							<li class="list-group-item bg-transparent">Current Page: ${PRODUCTS.number+1}</li>
						</ul>
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="/admin/product?p=0&&field=${fieldParam }">First</a></li>
								<li class="page-item"><a class="page-link" href="/admin/product?p=${PRODUCTS.number -1}&&field=${fieldParam }">Prev</a></li>
								<li class="page-item"><a class="page-link" href="/admin/product?p=${PRODUCTS.number +1}&&field=${fieldParam }">Next</a></li>
								<li class="page-item"><a class="page-link" href="/admin/product?p=${PRODUCTS.totalPages -1}&&field=${fieldParam }">Last</a>
								</li>
							</ul>
						</nav>
					</div>
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
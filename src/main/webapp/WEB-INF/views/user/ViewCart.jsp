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

	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Product</th>
							<th>Quantity</th>
							<th class="text-center">Price</th>
							<th class="text-center">Amount</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="item" items="${ORDER_DETAILS}">

						<form action="/shoppingCart/update" method="">
							<input type="hidden" name="id" value="${item.product.id}" />
							<tr>
								<td class="col-sm-8 col-md-6">
									<div class="media" >
										<a class="thumbnail pull-left" style="margin-right: 10px;" href="#"> <img src="/img/${item.product.image}"
											alt="" style="width: 72px; height: 48px;">
										</a>
										<div class="media-body">
											<h4 class="media-heading">${item.product.name}</h4>
											<h5 class="media-heading">by Brand name</h5>
										</div>
									</div>
								</td>
								<td><input name="qty" value="${item.quantity}"
									onblur="this.form.submit()" style="width: 70px; height: 32px"></td>
								<td class="col-sm-1 col-md-1 text-center"><strong>${item.price}</strong></td>
								<td class="col-sm-1 col-md-1 text-center"><strong>${item.price*item.quantity}</strong></td>
								<td class="col-sm-1 col-md-1">
									<a class="btn btn-primary btn-sm"
									href="/shoppingCart/remove/${item.product.id}">Remove</a>
								</td>
							</tr>
						</form>
						</c:forEach>
					
						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h3>Total</h3></td>
							<td class="text-right"><h3>
									<strong>${TOTAL_AMOUNT}</strong>
								</h3></td>
						</tr>
						<tr>
							<td> </td>
							<td> </td>
							
							<td>
								<button class="btn btn-default" onclick="window.location.href='/store/view'">
									<span class="glyphicon glyphicon-shopping-cart"></span>
									<strong>Continue Shopping</strong> 
								</button>
							</td>
							<td>
								<button class="btn btn-danger" onclick="window.location.href='/shoppingCart/clear'">
									<span class="glyphicon glyphicon-shopping-cart"></span>
									<strong>Clear</strong>
								</button>
							</td>
							<td>
								<button type="button" class="btn btn-success " onclick="window.location.href='/checkout/view'">
									<strong>Checkout</strong> <span class="glyphicon glyphicon-play"></span>
								</button>
							</td>
						</tr>
					</tbody>
				</table>
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

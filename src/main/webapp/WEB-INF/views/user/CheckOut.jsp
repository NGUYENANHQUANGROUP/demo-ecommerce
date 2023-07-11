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

<title>ASM</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="/user/css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="/user/css/slick.css" />
<link type="text/css" rel="stylesheet" href="/user/css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet"
	href="/user/css/nouislider.min.css" />

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

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- Order Details -->
				<div class="col-md-5">
					<!-- Order Details -->

					<div class="section-title text-center">
						<h3 class="title">Your Order</h3>
						<p style="color: red">${MESSAGE}</p>
					</div>
					<div class="order-summary">
						<div class="order-col">
							<div>
								<strong>PRODUCT</strong>
							</div>
							<div>
								<strong>TOTAL</strong>
							</div>
						</div>
						<div class="order-products">
							<c:forEach var="item" items="${ORDER_DETAILS}">
								<div class="order-col">
									<div>${item.quantity}x${item.product.name }</div>
									<div>$${item.price }</div>
								</div>
							</c:forEach>

						</div>
						<div class="order-col">
							<div>Shiping</div>
							<div>
								<strong>FREE</strong>
							</div>
						</div>
						<div class="order-col">
							<div>
								<strong>TOTAL</strong>
							</div>
							<div>
								<strong class="order-total">$${TOTAL_AMOUNT }</strong>
							</div>
						</div>
					</div>



					<!-- /Order Details -->
				</div>
				<!-- /Order Details -->

				<div class="col-md-7">
					<!-- Billing Details -->
					<form action="/checkout/submit">
						<div class="billing-details">
							<div class="section-title text-center">
								<h3 class="title">Billing address</h3>
							</div>
							<div class="form-group">
								<input class="input" type="text" name="username"
									value="${ACCOUNT.username }" placeholder="Username" disabled>
							</div>
							<div class="form-group">
								<input class="input" type="text" name="fullname"
									value="${ACCOUNT.fullname }" placeholder="Full Name" disabled>
							</div>
							<div class="form-group">
								<input class="input" type="email" name="email"
									value="${ACCOUNT.email }" placeholder="Email">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="address"
									placeholder="Shipping Address">
								<p style="color: red">${ERR_ADRESS}</p>
							</div>
							<div class="form-group">
								<input class="input" type="tel" name="phone"
									placeholder="Number Phone">
							</div>
						</div>
						<!-- /Billing Details -->


						<!-- Order notes -->
						<div class="order-notes">
							<textarea class="input" placeholder="Order Notes"></textarea>
						</div>
						<!-- /Order notes -->
						<div class="text-center">
							<button type="submit" class="primary-btn order-submit">Place
								order</button>
						</div>
					</form>
				</div>

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

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

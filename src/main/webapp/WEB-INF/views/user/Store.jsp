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

				<!-- STORE -->
				<div id="store" class="col-md-12 bodyStore">
					<!-- store top filter -->
					<div class="store-filter clearfix">
						<div class="store-sort">
							<div style="display: flex; align-items: center;">
								<label> Sắp Xếp Theo: </label>
								<form action="/store/view">
									<select id="fieldSelect" name="field" class="input-select"
										oninput="this.form.submit()">
										<option value="price"
											${fieldParam == 'price' ? 'selected' : ''}>Giá Giảm
											Dần</option>
										<option value="priceASC"
											${fieldParam == 'priceASC' ? 'selected' : ''}>Giá
											Tăng Dần</option>
										<option value="createDate"
											${fieldParam == 'createDate' ? 'selected' : ''}>Sản
											Phẩm Mới</option>
										<option value="createDateASC"
											${fieldParam == 'createDateASC' ? 'selected' : ''}>Sản
											Phẩm Cũ</option>
									</select>
								</form>
							</div>

						</div>

					</div>
					<!-- /store top filter -->

					<!-- store products -->
					<div class="row">
						<c:forEach var="product" items="${PRODUCTS.content}">
							<!-- product -->
							<div class="col-md-3 col-xs-6">
								<div class="product">
									<h4 class="product-header">
										<a class="text-white" href="/store/productDetail/${product.id}">${product.name}</a>
									</h4>
									<a href="/store/productDetail/${product.id}">
										<div style="background-color: white; position: relative; z-index: 4">
											<div class="product-img" style="padding: 20px">
												<img src="/img/${product.image}" alt=""
													class="img-thumbnail img-fluid">
											</div>

											<div class="product-body">
												<div class="product-rating">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-o"></i>
												</div>
											</div>

											<p class="text-center">
												<strong>${product.category.name}</strong>
											</p>
											<div class="product-body">
												<h4 class="product-price">
													$${product.price}
													<del class="product-old-price"></del>
												</h4>
											</div>
										</div>
									</a>




									<div class="add-to-cart">
										<button class="add-to-cart-btn"
											onclick="addToCart(${product.id})">
											<i class="fa fa-shopping-cart"></i> add to cart
										</button>

									</div>
								</div>
							</div>
							<!-- /product -->
						</c:forEach>

					</div>
					<!-- /store products -->

					<!-- store bottom filter -->
					<div class="store-filter clearfix">

						<ul class="store-pagination">
							<li class="page-item"><a class="page-link"
								href="/store/view?p=0&&field=${fieldParam }">First</a></li>
							<li class="page-item"><a class="page-link"
								href="/store/view?p=${PRODUCTS.number -1}&&field=${fieldParam }">Prev</a></li>
							<li class="page-item"><a class="page-link"
								href="/store/view?p=${PRODUCTS.number +1}&&field=${fieldParam }">Next</a></li>
							<li class="page-item"><a class="page-link"
								href="/store/view?p=${PRODUCTS.totalPages -1}&&field=${fieldParam }">Last</a></li>
						</ul>
						<ul>
							<li class="store-qty">Showing ${PRODUCTS.numberOfElements}
								products</li>
							<li class="store-qty">Total products:
								${PRODUCTS.totalElements}</li>
						</ul>
					</div>


					<!-- /store bottom filter -->
				</div>
				<!-- /STORE -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->




	<!-- FOOTER -->
	<%@include file="Footer.jsp"%>
	<!-- /FOOTER -->



	<script>
    function addToCart(productId) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/shoppingCart/add/" + productId, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
            	var response = xhr.responseText;
                var parser = new DOMParser();
                var html = parser.parseFromString(response, "text/html");
                var orderDetails = html.querySelector("#header .qty");
                var totalAmount = html.querySelector("#header .total");
                
                
                
             // Cập nhật số lượng sản phẩm trong giỏ hàng
                var qtyElement = document.querySelector("#header .qty");
                qtyElement.textContent = orderDetails.textContent;
                
                
                var cartList = document.querySelector(".cart-list");
                cartList.innerHTML = html.querySelector(".cart-list").innerHTML;
           
             	
                // Cập nhật tổng số tiền
                var totalElement = document.querySelector("#header .total");
                totalElement.textContent = totalAmount.textContent;
                
            }
        };
        xhr.send();
    }
	</script>










	<!-- jQuery Plugins -->
	<script src="/user/js/jquery.min.js"></script>
	<script src="/user/js/bootstrap.min.js"></script>
	<script src="/user/js/slick.min.js"></script>
	<script src="/user/js/nouislider.min.js"></script>
	<script src="/user/js/jquery.zoom.min.js"></script>
	<script src="/user/js/main.js"></script>

</body>
</html>

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



	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- ASIDE -->
				<div id="aside" class="col-md-3">
					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Categories</h3>
						<div class="checkbox-filter">
							<div class="input-checkbox">
								<input type="checkbox" id="category-1" name="categories"
									value="Laptops"> <label for="category-1"> <span></span>
									Laptops
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="category-2" name="categories"
									value="PC"> <label for="category-2"> <span></span>
									PC
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="category-3" name="categories"
									value="Smartphones"> <label for="category-3"> <span></span>
									Smartphones
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="category-4" name="categories"
									value="Tablets"> <label for="category-4"> <span></span>
									Tablets
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="category-5" name="categories"
									value="Headphones"> <label for="category-5"> <span></span>
									Headphones
								</label>
							</div>
						</div>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Price</h3>
						<div class="price-filter">
							<div id="price-slider"></div>
							<div class="input-number price-min">
								<input name="minPrice" id="price-min" type="number"> <span
									class="qty-up">+</span> <span class="qty-down">-</span>
							</div>
							<span>-</span>
							<div class="input-number price-max">
								<input name="maxPrice" id="price-max" type="number"> <span
									class="qty-up">+</span> <span class="qty-down">-</span>
							</div>
						</div>
						<button class="btn btn-danger" onclick = "productFilter()">
							<span class="glyphicon glyphicon-shopping-cart"></span> <strong>Filter</strong>
						</button>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Brand</h3>
						<div class="checkbox-filter">
							<div class="input-checkbox">
								<input type="checkbox" id="brand-1"> <label
									for="brand-1"> <span></span> SAMSUNG <small>(578)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-2"> <label
									for="brand-2"> <span></span> LG <small>(125)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-3"> <label
									for="brand-3"> <span></span> SONY <small>(755)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-4"> <label
									for="brand-4"> <span></span> SAMSUNG <small>(578)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-5"> <label
									for="brand-5"> <span></span> LG <small>(125)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-6"> <label
									for="brand-6"> <span></span> SONY <small>(755)</small>
								</label>
							</div>
						</div>
					</div>
					<!-- /aside Widget -->
				</div>
				<!-- /ASIDE -->

				<!-- STORE -->
				<div id="store" class="col-md-9 displayProduct">
					<!-- store top filter -->
					<div class="store-filter clearfix">
						<div class="store-sort">
							<div style="display: flex; align-items: center;">
								<label> Sắp Xếp Theo: </label>
								<form action="/store/filter">
									<select id="fieldSelect" name="field" class="input-select"
										oninput="sendRequest()">
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
							<div class="col-md-4 col-xs-6">

								<div class="product">
									<h5 class="product-header" >
										<a class = "text-white" href="#">${product.name}</a>
									</h5>
									
									<div style = "background-color: white; position: relative;z-index: 4">
									<div class="product-img" style = "padding: 20px">
										<img src="/img/${product.image}" alt="" class="img-thumbnail img-fluid">
									</div>
									
									<div class = "product-body">
										<div class="product-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star-o"></i>
										</div>
									</div>
									
									<p class = "text-center"><strong >${product.category.name}</strong></p>
									<div class="product-body" >
										<h4 class="product-price">
											$${product.price}
											<del class="product-old-price"></del>
										</h4>
									</div>
									</div>
									
									
								
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
								href="/store/filter?p=0&&field=${fieldParam }" onclick="submitPage(event)"
								>First</a></li>
							<li class="page-item"><a class="page-link"
								href="/store/filter?p=${PRODUCTS.number -1}&&field=${fieldParam }" onclick="submitPage(event)"
								>Prev</a></li>
							<li class="page-item"><a class="page-link"
								href="/store/filter?p=${PRODUCTS.number +1}&&field=${fieldParam }" onclick="submitPage(event)"
								>Next</a></li>
							<li class="page-item"><a class="page-link"
								href="/store/filter?p=${PRODUCTS.totalPages -1}&&field=${fieldParam }" onclick="submitPage(event)"
								>Last</a></li>
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


	<script>
		function productFilter() {
		    // Lấy giá trị các input
		    var categories = [];
		    var checkboxes = document.querySelectorAll("input[name='categories']:checked");
		    checkboxes.forEach(function(checkbox) {
		        categories.push(checkbox.value);
		    });
		    var minPrice = document.getElementById("price-min").value;
		    var maxPrice = document.getElementById("price-max").value;
		
		    // Tạo URL truy vấn
		    var url = "/store/filter?";
		    if (categories.length > 0) {
		        url += "categories=" + categories.join(",") + "&";
		    }
		    if (minPrice) {
		        url += "minPrice=" + minPrice + "&";
		    }
		    if (maxPrice) {
		        url += "maxPrice=" + maxPrice;
		    }
		
		    var xhr = new XMLHttpRequest();
		    xhr.open("GET", url, true);
		
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === 4 && xhr.status === 200) {
		            var response = xhr.responseText;
		            var parser = new DOMParser();
		            var html = parser.parseFromString(response, "text/html");
		            console.error("thanh công Mã trạng thái: " + xhr.status);
		            var displayProduct = document.querySelector(".displayProduct");
		            displayProduct.innerHTML = html.querySelector(".displayProduct").innerHTML;
		        } else {
		            console.error("Yêu cầu không thành công. Mã trạng thái: " + xhr.status);
		        }
		    };
		    xhr.send();
		}
	</script>

	<script>
		function submitPage(event) {
			event.preventDefault(); // Ngăn chặn hành vi mặc định của liên kết

		    var url = event.target.href; // Lấy đường dẫn từ thuộc tính href của liên kết
			
		    
			var xhr = new XMLHttpRequest();
			xhr.open("GET", url, true);
			
			xhr.onreadystatechange = function() {
		        if (xhr.readyState === 4 && xhr.status === 200) {
		            var response = xhr.responseText;
		            var parser = new DOMParser();
		            var html = parser.parseFromString(response, "text/html");
		            console.error("thanh công Mã trạng thái: " + xhr.status);
		            var displayProduct = document.querySelector(".displayProduct");
		            displayProduct.innerHTML = html.querySelector(".displayProduct").innerHTML;
		        } else {
		            console.error("Yêu cầu không thành công. Mã trạng thái: " + xhr.status);
		        }
		    };
		    xhr.send();
		}
	</script>
	
		<script>
		function sendRequest() {
			var field = document.getElementById('fieldSelect').value;
			var xhr = new XMLHttpRequest();
			xhr.open('GET', '/store/filter?field=' + field, true);
			xhr.onreadystatechange = function() {
		        if (xhr.readyState === 4 && xhr.status === 200) {
		            var response = xhr.responseText;
		            var parser = new DOMParser();
		            var html = parser.parseFromString(response, "text/html");
		            console.error("thanh công Mã trạng thái: " + xhr.status);
		            var displayProduct = document.querySelector(".displayProduct");
		            displayProduct.innerHTML = html.querySelector(".displayProduct").innerHTML;
		        } else {
		            console.error("Yêu cầu không thành công. Mã trạng thái: " + xhr.status);
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

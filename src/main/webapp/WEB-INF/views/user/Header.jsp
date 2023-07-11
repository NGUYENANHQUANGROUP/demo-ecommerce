<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<!-- TOP HEADER -->
	<div id="top-header">
		<div class="container">
			<ul class="header-links pull-left">
				<li><a href="#"><i class="fa fa-phone"></i> +84-915416075</a></li>
				<li><a href="#"><i class="fa fa-envelope-o"></i>
						nguyenanhquangroup@email.com</a></li>
				<li><a href="#"><i class="fa fa-map-marker"></i> 204/9 Bùi
						Thị Xuân</a></li>
			</ul>
			<ul class="header-links pull-right">
				<c:choose>
					<c:when test="${empty sessionScope.ACCOUNT}">
						<li><a href="/account/login"><i class="fa fa-key"></i>
								Login</a></li>
						<li><a href="/account/register"><i class="fa fa-user-o"></i>
								Register</a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${sessionScope.ACCOUNT.isAdmin()}">
								<li><a href="/admin/search&page"><i class="fa fa-user-o"></i>
								Manager</a></li>
							</c:when>
						</c:choose>
						
						<li><a href="#"><i class="fa fa-user-o"></i>
								${sessionScope.ACCOUNT.username}</a></li>
						<li><a href="/account/logout"><i class="fa fa-user-o"></i>
								Logout</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<!-- /TOP HEADER -->

	<!-- MAIN HEADER -->
	<div id="header">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- LOGO -->
				<div class="col-md-3">
					<div class="header-logo">
						<a href="/home" class="logo"> <img src="/img/logoshop.png"
							alt="">
						</a>
					</div>
				</div>
				<!-- /LOGO -->

				<!-- SEARCH BAR -->
				<div class="col-md-6">
					<div class="header-search">
						<form action="/store/view">
							<select class="input-select" name="category">
								<option value="all" ${category == 'all' ? 'selected' : '' }>All
									Categories</option>
								<option value="Laptops"
									${category == 'Laptops' ? 'selected' : '' }>Laptops</option>
								<option value="PC" ${category == 'PC' ? 'selected' : '' }>PC</option>
								<option value="Smartphones"
									${category == 'Smartphones' ? 'selected' : '' }>Smartphones</option>
								<option value="Tablets"
									${category == 'Tablets' ? 'selected' : '' }>Tablets</option>
								<option value="Headphones"
									${category == 'Headphones' ? 'selected' : '' }>Headphones</option>
							</select> <input class="input" name="keyword" value="${keyword}"
								placeholder="Search here">
							<button type="submit" class="search-btn">Search</button>
						</form>
					</div>
				</div>
				<!-- /SEARCH BAR -->

				<!-- ACCOUNT -->
				<div class="col-md-3 clearfix">
					<div class="header-ctn">
						<!-- Cart -->
						<div class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown"
								aria-expanded="true"> <i class="fa fa-shopping-cart"></i> <span>Your
									Cart</span>
								<div class="qty ">${TOTAL_PRODUCT}</div>
							</a>
							<div class="cart-dropdown">
								<div class="cart-list">
									<c:forEach var="item" items="${ORDER_DETAILS }">
										<div class="product-widget">
											<div class="product-img">
												<img src="/img/${item.product.image }" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name">
													<a href="#">${item.product.name }</a>
												</h3>
												<h4 class="product-price">
													<span>${item.quantity }</span>x $${item.price }
												</h4>
											</div>
											<button class="delete">
												<i class="fa fa-close"></i>
											</button>
										</div>
									</c:forEach>

								</div>
								<div class="cart-summary">
									<h5 class="total" id="total">SUBTOTAL: $${TOTAL_AMOUNT }</h5>
								</div>
								<div class="cart-btns">
									<a href="/shoppingCart/view">View Cart</a> <a
										href="/checkout/view">Checkout <i
										class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
						</div>
						<!-- /Cart -->

						<!-- Menu Toogle -->
						<div class="menu-toggle">
							<a href="#"> <i class="fa fa-bars"></i> <span>Menu</span>
							</a>
						</div>
						<!-- /Menu Toogle -->
					</div>
				</div>
				<!-- /ACCOUNT -->
			</div>
			<!-- row -->
		</div>
		<!-- container -->
	</div>
	<!-- /MAIN HEADER -->
</header>
<!-- NAVIGATION -->
<nav id="navigation">
	<!-- container -->
	<div class="container">
		<!-- responsive-nav -->
		<div id="responsive-nav">
			<!-- NAV -->
			<ul class="main-nav nav navbar-nav">
				<li class="active"><a href="/home">Home</a></li>
				<li><a href="/store/view?keyword=&&category=all">All
						Categories</a></li>
				<li><a href="/store/view?keyword=&&category=Laptops">Laptops</a></li>
				<li><a href="/store/view?keyword=&&category=PC">PC</a></li>
				<li><a href="/store/view?keyword=&&category=Smartphones">Smartphones</a></li>
				<li><a href="/store/view?keyword=&&category=Tablets">Tablets</a></li>
				<li><a href="/store/view?keyword=&&category=Headphones">Headphones</a></li>
				<li><a href="/store/filter">Filter</a></li>
			</ul>
			<!-- /NAV -->
		</div>
		<!-- /responsive-nav -->
	</div>
	<!-- /container -->
</nav>
<!-- /NAVIGATION -->



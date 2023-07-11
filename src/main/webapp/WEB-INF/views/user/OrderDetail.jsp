<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>Shopping Cart</h2>
		<div class="rows">
			<div class="col-sm-9">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Amount</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="item" items="${ORDER_DETAILS}">
							<form action="/shoppingCart/update" method="">
								<input type="hidden" name="id" value="${item.product.id}" />
							<tr>
								<td>${item.product.id }</td>
								<td>${item.product.name }</td>
								<td>${item.price}</td>
								<td><input name="qty" value="${item.quantity}"
									onblur="this.form.submit()" style="width: 50px;"></td>
								<td>${item.price*item.quantity}</td>
								<td><a class="btn btn-primary btn-sm"
									href="/shoppingCart/remove/${item.product.id}">Remove</a></td>
							</tr>
							</form>
						</c:forEach>


					</tbody>
				</table>
				<p>Tong Tien:${TOTAL}</p>
				<hr />
				<a class="btn btn-primary btn-sm" href="/shoppingCart/clear">Clear
					Cart</a> <a class="btn btn-primary btn-sm" href="/product/view">Add
					more</a>
			</div>
		</div>

	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
		<h2>List Users</h2>
		<a href="/Account/register" class="btn btn-primary">Add
			Users</a>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Photo</th>
					<th>UserName</th>
					<th>Password</th>
					<th>FullName</th>
					<th>Email</th>					
					<th>Activated</th>
					<th>Admin</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>	
				<c:forEach var = "ac" items = "${ACCOUNTS}">
					<tr>
					<td align="center"><img src="/uploads/user_img/${ac.getPhoto()}" width="40" height="40"/></td>
					<td>${ac.getUsername()}</td>
					<td>${ac.getPassword() }</td>
					<td>${ac.getFullname() }</td>
					<td>${ac.getEmail() }</td>
					<td>${ac.activated?"Online":"Offline" }</td>
					<td>${ac.admin?"Admin":"User" }</td>
					<td><a class="btn btn-primary btn-sm" href="/Account/register/${ac.getUsername()}">Edit</a>
						| <a class="btn btn-danger btn-sm" href="?btnDel=&username=${ac.getUsername()}">Del</a></td>
				</tr>
				</c:forEach>	
			</tbody>
		</table>
	</div>
</body>
</html>


<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>LAB 6</title>

</head>
<body>
	${message}
<%-- 		<table class="table table-hover">
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>QUANTITY</th>
				<th>PHOTO1</th>
				<th>PHOTO1</th>
				<th>PHOTO1</th>
				<th>PHOTO1</th>
				<th></th>
			</tr>
		<c:forEach var="u" items="${order}">
			<tr>
				<td>${u.id}</td>
				<td>${u.name}</td>
				<td>${u.datefound}</td>
				<td>${u.address}</td> 
				<td>${u.email}</td> 
				<td>${u.status}</td> 
				<td>${u.products.id}</td> 
			</tr>
		</c:forEach>
		</table>
		<a href="insert.htm">Insert</a>
		<a href="update.htm">Update</a> --%>
		
		<form:form action="update.htm" modelAttribute="order">
			${order.id}
			${order.name}
			${order.datefound}
			${order.products.id}
		</form:form>
</body>
</html>
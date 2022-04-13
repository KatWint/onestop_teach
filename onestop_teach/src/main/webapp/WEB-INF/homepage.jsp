<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/style.css">
<title>Home</title>
</head>
<body>
<a href="/logout">Logout</a>
<h1>Welcome!!!!</h1>
<p>Here are the available resources, broken down by category.</p>
<div>
<p>Available Reading Sites:</p>
  	<table class="table table-success table-striped">
      		<thead>
				<tr>
					<th>Title</th>
					<th>Link</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${reading}" var="reading">
				<tr>
					<td>${reading.name}</td>
					<td>${reading.link}</td>
					<td>${reading.description} </td>
				</tr>
				</c:forEach>	
			</tbody>
	</table>
</div>
<div>
<p>Available Math Sites:</p>
  	<table class="table table-success table-striped">
      		<thead>
				<tr>
					<th>Title</th>
					<th>Link</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${mathematics}" var="mathematics">
				<tr>
					<td>${mathematics.name}</td>
					<td>${mathematics.link}</td>
					<td>${mathematics.description} </td>
				</tr>
				</c:forEach>	
			</tbody>
	</table>
</div>
<div>
<p>Available PreMade Worksheets Sites:</p>
  	<table class="table table-success table-striped">
      		<thead>
				<tr>
					<th>Title</th>
					<th>Link</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${worksheets}" var="worksheets">
				<tr>
					<td>${worksheets.name}</td>
					<td>${worksheets.link}</td>
					<td>${worksheets.description} </td>
				</tr>
				</c:forEach>	
			</tbody>
	</table>
</div>
<div>
<p>Available Writing Sites:</p>
  	<table class="table table-success table-striped">
      		<thead>
				<tr>
					<th>Title</th>
					<th>Link</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${writing}" var="writing">
				<tr>
					<td>${writing.name}</td>
					<td>${writing.link}</td>
					<td>${writing.description} </td>
				</tr>
				</c:forEach>	
			</tbody>
	</table>
</div>
</body>
</html>
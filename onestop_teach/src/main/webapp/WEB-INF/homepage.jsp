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
<h1>Welcome <c:out value="${loggedInUser.userName}"></c:out>!!!!</h1>
<p>Here are the available resources, broken down by category.</p>
<p>If you have a site that is not listed here and feel it would be helpful, please <a href="/link/new">Add link here</a></p>
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
					<td><a href="${reading.link}">${reading.link}</a>
						</td>
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
					<td><a href="${mathematics.link}">${mathematics.link}</a></td>
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
					<td><a href="${worksheets.link}">${worksheets.link}</a></td>					<td>${worksheets.description} </td>
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
					<td><a href="${writing.link}">${writing.link}</a></td>
					<td>${writing.description} </td>
				</tr>
				</c:forEach>	
			</tbody>
	</table>
</div>
<div>
<p>Feedback and Thoughts</p>
  	<table class="table table-success table-striped">
      		<thead>
				<tr>
					<th>Comment</th>
					<th>User</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${comments}" var="comments">
				<tr>
					<td>${comments.comment}</td>
					<td>${comments.user.userName}</td>
					<td>
					<c:if test="${comments.user.id==loggedInUser.id}">
						<a href="/updateComment/${comments.id}">Edit</a>
						<a href="/deleteComment/${comments.id}">Delete</a>
					</c:if>
					</td>
				</tr>
				</c:forEach>	
			</tbody>
	</table>
</div>
<a href="/comment">Leave a comment</a>

</body>
</html>
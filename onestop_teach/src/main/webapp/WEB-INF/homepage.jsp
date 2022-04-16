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
<h1 class="headline">Welcome <c:out value="${loggedInUser.userName}"></c:out>!!!!</h1>
<p class="input">Here are the available resources, broken down by category.</p>
<p class="input">If you have a site that is not listed here and feel it would be helpful, please <a href="/link/new">Add link here</a></p>
<div>
<p class="headline">Available Reading Sites:</p>
<img alt="books" src="https://cdn.pixabay.com/photo/2015/12/19/20/32/paper-1100254_960_720.jpg"><p class="input">The sites listed below focus on reading activities as well as read alouds for you and your students to enjoy</p>
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
<p class="headline">Available Math Sites:</p>
<img alt="math" src="https://cdn.pixabay.com/photo/2019/02/22/19/03/numbers-4014181_960_720.jpg"><p class="input">The sites listed below focus on math activities for your students to practice the skills introduced in class</p>

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
<p class="headline">Available PreMade Worksheets Sites:</p>
<img alt="worksheets" src="https://cdn.pixabay.com/photo/2018/12/08/20/43/graphic-3863986_960_720.png">
<p class="input">These sites are for worksheets premade in different categories that you can either print out or assign online(depending on the site)</p>
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
					<td><a href="${worksheets.link}">${worksheets.link}</a></td>					
					<td>${worksheets.description} </td>
				</tr>
				</c:forEach>	
			</tbody>
	</table>
</div>
<div>
<p class="headline">Available Writing Sites:</p>
<img alt="writing" src="https://cdn.pixabay.com/photo/2016/06/29/08/50/pencils-1486278_960_720.jpg"><p class="input">The sites listed below focus on writing activities, some online and some that can be implemented in the classroom</p>
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
<div class="input">
<p>Feedback and Thoughts</p>
<img alt="thoughts" src="https://cdn.pixabay.com/photo/2016/03/31/21/37/bright-1296538_960_720.png">
<p class="input">Please leave any feedback or thoughts with what is available here.</p>
<p class="input">See what others have to say and add yours with the link at the bottom :)</p>
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
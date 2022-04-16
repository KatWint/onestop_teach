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
<title>Comment</title>
</head>
<body class="input">
<h1>Leave a comment</h1>
<a href="/home">Home</a>
<a href="/logout">Logout</a>
<form:form action="/addcomment" method="post" modelAttribute="newComment">
	<p>
 		<form:errors path="comment"/>
        <form:label path="comment">Your Comment:</form:label>
        <form:textarea path="comment"/>
    </p>
    <form:input type="hidden" value="${loggedInUser.id}" path="user"/>
    
	<button class="btn btn-primary">Submit</button>
</form:form>
</body>
</html>
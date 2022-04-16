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
<title>New Site</title>
</head>
<body class="input">
<h1>Thank you for adding more resources!</h1>
<a href="/home">Home</a>
<a href="/logout">Logout</a>
<form:form action="/addlink" method="post" modelAttribute="newLink">
	<p>
 		<form:errors path="name"/>
        <form:label path="name">Title of Site</form:label>
        <form:input path="name"/>
    </p>
    <p>
        <form:label path="category">Description of site</form:label>
        <form:errors path="category"/>     
        <form:select path="category">
        <form:option value="Reading">Reading</form:option>
        <form:option value="Writing">Writing</form:option>
        <form:option value="Math">Math</form:option>
        <form:option value="Worksheets">Premade Worksheets</form:option>
 		</form:select>
 	</p>
    <p>
        <form:label path="link">Link to website</form:label>
        <form:errors path="link"/>
        <form:input path="link"/>
    </p>
    <p>
        <form:label path="description">Description of site</form:label>
        <form:errors path="description"/>     
        <form:textarea path="description"/>
    </p> 
    <form:input type="hidden" value="not approved" path="approval"/>
    
	<button class="btn btn-primary">Submit</button>
</form:form>
</body>
</html>
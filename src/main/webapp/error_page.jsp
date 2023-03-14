<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry! Something went wrong</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="container text-center">

		<img alt="" src="img/computer1.png" class="img-fluid rounded"><br>
		<%= exception %>
		<h3 class="display-4">Something went wrong</h3>
		<a class="btn btn-outline-primary btn-lg mt-3" href="index.jsp">Home</a>
	
</div>

</body>
</html>
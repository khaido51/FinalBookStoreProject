<%@page import="book.store.service.GenreService"%>
<%@page import="book.store.entity.Genre"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>


<nav>
		<ul>
			<c:forEach var="genre" items="${genreList}">
				<a href="book?genreId=${genre.id }">
				<li>${genre.name}</li></a>
			</c:forEach>
			
		</ul>
	</nav>


</body>
</html>
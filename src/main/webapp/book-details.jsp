<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>
</head>
<body>
<li> Book ISBN: ${book.isbn} </li>
<li> Book Title: ${book.title} </li>
<li> Book Price: ${book.price} </li>
<li> Book Quantity: ${book.stock} </li>
<li> Book Edition: ${book.edition} </li>
<a href="#"> <li>Author : ${author.name}</li></a>
</body>
</html>
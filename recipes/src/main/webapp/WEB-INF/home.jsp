<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- allows our little scripts -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe</title>
</head>
<body>


<h1>Home Page</h1>

<a href="createForm.do"><button>Add Recipe</button></a>
<a href="home.do">should send me back</a>

${recipeList}



</body>
</html>
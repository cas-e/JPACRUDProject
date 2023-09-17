<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Recipe Site</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

	
</head>
<body>


<div class="container ">
	
	 	
	 	<br>

		<h1>
		${title }
	    </h1>
	    <br>

	    	<p><strong>Time: ${time}</strong></p>

	    	<p><strong>Serves: ${serves}</strong></p>

	    <br>
	    <h5>Ingredients</h5>
	    <div  class="container">
	    	

	    	<div id="ingredientList">
	    	<c:forEach var="ingredient" items="${ingredientList}">
	    	<p>${ingredient}</p>
	    	</c:forEach>

	    	</div>

	    	
	    </div>

	    <br>

	    <div id="stepsList">
	    
	    <c:forEach var="step" items="${stepList }">
	    <p>${step}</p>
	    </c:forEach>
	   
		</div>

	    
	    <br>
	    <br>
	

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>


</body>
</html>
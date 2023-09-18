<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- allows our little scripts -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>test</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>



	<br>
	<div class="container">
		<h1>Recipe Site</h1>
		<br>
		<br>
		
		<a href="createForm.do" class="btn btn-primary">Create New Recipe</a>
		
	</div>
	<br>
	<br>
	
	
	<div class="container">

		<div class="row">

			<c:forEach var="recipe" items="${recipeList }">
			
				<div class="col-12 col-md-6 col-lg-4">
					<div class="card ">
						<img src="${recipe.imageURL}">
						<h3 class="card-title">
							<a href="displayRecipe.do?rid=${recipe.id} ">${recipe.title}</a>
						</h3>
					</div>
				</div>

			</c:forEach>


		</div>





	</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>
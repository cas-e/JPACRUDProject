<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Recipe Site</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

	<style>
.my-form {
	font-family: inherit;
	font-size: inherit;
	resize: none;
	/* hack : sets to min height of the default text */
	height: 1px;
}
</style>
</head>
<body>

<form action="createRecipe.do" method="post">
	<h1>
	<textarea name= "recipeTitle" class="form-control my-form" placeholder="Title" type="text"></textarea>
    </h1>

    <p>
    <textarea name="steps" placeholder="first instruction" class="form-control my-form" type="text"></textarea>
    </p>

     <p>
    <textarea name="steps" placeholder="second instruction" class="form-control my-form" type="text"></textarea>
    </p>

    <button type="submit" class="btn btn-outline-dark btn-sm">Save</button>
    <button type="button" class="btn btn-outline-dark btn-sm">New Paragraph</button>
</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<script>
function customTextAreas() {
	var forms = document.getElementsByClassName('my-form');

	for (let form of forms) {
		console.log("added form stuff")

		/* allows the text area to appear to grow */
		form.addEventListener('input', function() {
        	this.style.overflow = 'hidden';
        	this.style.height = 0;
        	this.style.height = this.scrollHeight + 'px';
    	}, false);

		/* having arbitrary line breaks complicates mapping to and from paragraph
		   styling, so we disable it */
		form.addEventListener("keypress", function (e) {
    		if (e.code === "Enter") {  //checks whether the pressed key is "Enter"
				
				e.preventDefault();
    		}
		}, false);
	}
}

customTextAreas();
</script>

</body>
</html>
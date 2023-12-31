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

.my-ingredient {
	font-weight: bold;
}

.my-content {
	max-width: 700px;
}

.time-serves {
	padding-top: 10px;
	min-width: 60px;
}
	</style>
</head>
<body>


<div class="container my-content">
	<br>
	<br>
	 <form action="confirmEdit.do" method="post">
	<input type="hidden" name="recId" value="${recId}">
	
		<h1>
		<textarea name= "recipeTitle" class="form-control my-form" placeholder="Title" type="text">${title }</textarea>
	    </h1>
	    
	    	<div class="d-flex flex-row">
	    		<div class="p-2"><h6 class="time-serves">Time: </h6> </div>
	    		<div class="p-2"><input name="time" placeholder="${time }" class="form-control"></div>

	    	</div>

	    	<div class="d-flex flex-row">
	    		<div class="p-2"><h6 class="time-serves">Serves: </h6></div>
	    		<div class="p-2"><input name="servings" placeholder="${serves}" class="form-control"></div>

	    	</div>

	    <br>
	    <div  class="container">
	    	
	    	
	    	
	    	
	    	
	    	<div id="ingredientList">
	    	
	    	<c:forEach var="ingredient" items="${ingredientList}">
	    	<p>
	    	<textarea name="ingredients" placeholder="first ingredient" class="form-control my-form my-ingredient" type="text">${ingredient }</textarea> 
	    	</p>
			</c:forEach>

	    	</div>

	    	<button id="ingredientButton" type="button" class="btn btn-outline-dark btn-sm">Additional Ingredient</button>
	    </div>

	    <br>

	    <div id="stepsList">
	    <c:forEach var="step" items="${stepList }">
	    <p>
	    <textarea name="steps" placeholder="first instruction" class="form-control my-form" type="text">${step }</textarea>
	    </p>
	    </c:forEach>
		</div>

	    <button  id="stepButton" type="button" class="btn btn-outline-dark btn-sm">Additional Instruction</button>
	    <br>
	    <br>
	    <p>
	    	<textarea name= "imageURL" class="form-control my-form" placeholder="image url for recipe card" type="text">${imageURL }</textarea>
	    </p>
	    
	    <button type="submit" class="btn btn-outline-dark btn-sm">Confirm Recipe Edit</button>
	</form>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

	<script type="text/javascript">

	main();

	function main() {
		customTextAreas();
		stopInputSends();
	}

	function customTextAreas() {
		let forms = document.getElementsByClassName('my-form');
		for (let form of forms) {
			disableScroll(form);
			onEnter(form, noOp);
			
			// set up the text areas on load
			form.style.overflow = 'hidden';
        	form.style.height = 0;
        	form.style.height = form.scrollHeight + 'px';
		}
		
		let ib = document.getElementById('ingredientButton');
		ib.addEventListener('click', insertsIngredient);

		let sb = document.getElementById('stepButton');
		sb.addEventListener('click', insertsStep);

	}

	/* stretch goal: change to tab behavior instead of no op */
	function noOp() {};

	function stopInputSends() {
		let inputs = document.getElementsByTagName('input');
		for (let input of inputs) {
			onEnter(input, noOp);
		}
	}

	/* does is the function to apply on an enter event */
	function onEnter(el, does) {
		let f = function(e) {
			if (e.code === "Enter") {  
				e.preventDefault();
				does();
			}
	    };

	    el.addEventListener('keypress', f);
	}


	
	function disableScroll(el) {
		el.addEventListener('input', function() {
	        	this.style.overflow = 'hidden';
	        	this.style.height = 0;
	        	
	        	this.style.height = this.scrollHeight + 'px';
	    	}, false);
		
		
		el.addEventListener('keyup', function() {
        	this.style.overflow = 'hidden';
        	this.style.height = 0;
        	
        	this.style.height = this.scrollHeight + 'px';
    	}, false);
	}

	function insertsIngredient() {
		let p = document.createElement('p');
		p.innerHTML = '<textarea name="ingredients" placeholder="next ingredient" class="form-control my-form my-ingredient" type="text"></textarea>';
		disableScroll(p.getElementsByTagName('textarea')[0]);
		let target = document.getElementById('ingredientList');
		target.append(p)	
	}

	function insertsStep() {
		let p = document.createElement('p');
		p.innerHTML = '<textarea name="steps" placeholder="next instruction" class="form-control my-form" type="text"></textarea>';
		disableScroll(p.getElementsByTagName('textarea')[0]);
		let target = document.getElementById('stepsList');
		target.append(p)
	}

	</script>

</body>
</html>
package com.skilldistillery.recipes.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.recipes.data.RecipeDao;
import com.skilldistillery.recipes.entities.Recipe;

@Controller
public class RecipeController {

	@Autowired
	private RecipeDao recipeDao;
	
	@RequestMapping(path = {"/", "home.do"})
	public String goHome(Model model) {
		model.addAttribute("recipeList", recipeDao.findAll());
		return "home"; // just need the base name of home
	}
	
	@RequestMapping(path = "createForm.do")
	public String showCreateForm(Model model) {
		System.out.println("createForm");
		return "recipe/createForm"; // hopefully goes to createForm.jsp
	}
	
	/*
	 * when this returns sets stuff, id ends up being zero. hopefully spring rectifys_ that
	 */
	@RequestMapping(path = "createRecipe.do", method = RequestMethod.POST)
	public String createRecipe(
			Model model, 
			String recipeTitle,
			String time,
			String servings,
			String[] ingredients,
			String[] steps,
			String imageURL) 
	{
		
			Recipe recipe = new Recipe();
			recipe.setTitle(recipeTitle);
			recipe.setMakeTime(time);
			recipe.setServes(servings);
			
			/* we may need to put this logic somewhere else */
			String sep = "<sep>";
			
			StringBuilder ib = new StringBuilder();
			
			for (String ingr : ingredients) {
				ib.append(ingr);
				ib.append(sep);
			}
			recipe.setIngredients(ib.toString());
			
			StringBuilder stb = new StringBuilder();
			for (String step : steps) {
				stb.append(step);
				stb.append(sep);
			}
			recipe.setInstructions(stb.toString());
			
			recipe.setImageURL(imageURL);
			
			
			System.out.println(recipe);
			Recipe maybeUpdated = recipeDao.create(recipe);
			
			System.out.println(maybeUpdated);
			
			System.out.println("done");
			return "home"; // send us right back for now
	}
}

package com.skilldistillery.recipes.controllers;

import java.util.ArrayList;
import java.util.List;

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
		
		return "recipe/createForm"; // hopefully goes to createForm.jsp
	}
	
	
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
	
	@RequestMapping(path = {"displayRecipe.do"})
	public String displayRecipe(Model model, int rid) {
		
		
		
		Recipe recipe = recipeDao.findById(rid);
		model.addAttribute("title", recipe.getTitle());
		model.addAttribute("time", recipe.getMakeTime());
		model.addAttribute("serves", recipe.getServes());
		
		/* again, put this somewhere else later */
		String sep = "<sep>";
		
		List<String> ingrs = filterEmpties(recipe.getIngredients().split(sep));
		model.addAttribute("ingredientList", ingrs);
		
		List<String> steps = filterEmpties(recipe.getInstructions().split(sep));
		model.addAttribute("stepList", steps);
		
		return "recipe/displayRecipe"; // just need the base name of home
	}
	
	private List<String> filterEmpties(String[] ss) {
		List<String> filtered = new ArrayList<>();
		for (String s : ss) {
			if (s.isEmpty()) {}
			else {
				filtered.add(s);
			}
		}
		return filtered;
	}
}

package com.skilldistillery.recipes.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.recipes.data.RecipeDao;

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
	
	@RequestMapping(path = "createRecipe.do", method = RequestMethod.POST)
	public String createRecipe(Model model, String recipeTitle, String[] steps) {
			System.out.println("something");
			System.out.println(recipeTitle);
			
			for (String step : steps) {
				System.out.println(step);
			}
			
			return "home"; // send us right back for now
	}
}

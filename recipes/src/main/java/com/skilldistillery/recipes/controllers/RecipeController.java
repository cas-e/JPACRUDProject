package com.skilldistillery.recipes.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}

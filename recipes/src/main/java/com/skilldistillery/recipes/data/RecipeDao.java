package com.skilldistillery.recipes.data;

import java.util.List;

import com.skilldistillery.recipes.entities.Recipe;


// THIS IS THE ONE OF THE BIG TODOs: IMPL THIS 
public interface RecipeDao {
	Recipe findById(int recipeId);
	
	List<Recipe> findAll();
	
	Recipe create(Recipe newRecipe);
	Recipe update(Recipe updatedRecipe);
	
	boolean deleteById(int recipeId);
}

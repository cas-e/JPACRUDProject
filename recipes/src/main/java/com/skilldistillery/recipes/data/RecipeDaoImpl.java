package com.skilldistillery.recipes.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.recipes.entities.Recipe;


@Service
@Transactional
public class RecipeDaoImpl implements RecipeDao {

	@PersistenceContext
	private EntityManager em;
	
	
	@Override
	public Recipe findById(int recipeId) {
		return em.find(Recipe.class, recipeId);
	}

	@Override
	public List<Recipe> findAll() {
		String query = "SELECT rs FROM Recipe rs";
		return em.createQuery(query, Recipe.class).getResultList();
	}

	@Override
	public Recipe create(Recipe newRecipe) {
		
		em.persist(newRecipe);
		
		return newRecipe;
	}

	@Override
	public Recipe update(Recipe updatedRecipe) {
		
		
		Recipe recipe = em.find(Recipe.class, updatedRecipe.getId());
		
		// why is this happening? do i need to learn reflection? or is their a better way?
		recipe.setId(updatedRecipe.getId());
		recipe.setTitle(updatedRecipe.getTitle());
		recipe.setMakeTime(updatedRecipe.getMakeTime());
		recipe.setServes(updatedRecipe.getServes());
		recipe.setIngredients(updatedRecipe.getIngredients());
		recipe.setInstructions(updatedRecipe.getInstructions());
		recipe.setImageURL(updatedRecipe.getImageURL());
		
		return recipe;
	}

	@Override
	public boolean deleteById(int recipeId) {
		Recipe recipe = em.find(Recipe.class, recipeId);
		if (recipe != null) {
			em.remove(recipe);
			return true;
		}
		return false;
	}

}

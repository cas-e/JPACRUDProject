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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(int recipeId) {
		// TODO Auto-generated method stub
		return false;
	}

}

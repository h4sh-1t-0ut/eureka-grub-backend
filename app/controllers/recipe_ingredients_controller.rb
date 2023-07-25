class RecipeIngredientsController < ApplicationController
    def index
      @recipe_ingredients = RecipeIngredient.all
      render json: { recipe_ingredients: @recipe_ingredients }
    end
  
    def show
      @recipe_ingredient = RecipeIngredient.find(params[:id])
      render json: { recipe_ingredient: @recipe_ingredient }
    end
  end
  
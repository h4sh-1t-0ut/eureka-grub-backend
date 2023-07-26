class RecipesController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_recipe, only: [:show, :update, :destroy]
  before_action :check_authorization, only: [:update, :destroy]

  def index
    recipes = Recipe.all
    render json: recipes
  end

  def create
    recipe = Recipe.create(recipe_params)
  
    if recipe.valid?
      render json: recipe, status: 201
    else
      puts recipe.errors.full_messages.inspect # Add this line for debugging
      render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)

    if recipe.valid?
      render json: recipe
    else
      render json: recipe.errors, status: 422
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    render json: recipe
  end

  private

  # def set_recipe
  #   recipe = Recipe.find_by(id: params[:id])

  #   unless recipe
  #     render json:  status: :not_found
  #   end
  # end

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :cook_time, :course, :servings, :allergies, :tutorial_link, :recipe_image, :ingredients, :user_id)
  end
end


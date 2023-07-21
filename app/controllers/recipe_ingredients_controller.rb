class RecipesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :check_authorization, only: [:edit, :update, :destroy]
    
    def index
      @recipes = Recipe.all
      render json: { recipes: @recipes }
    end
  
    def show
      # The @recipe variable has been set by the `set_recipe` method via before_action
      render json: { recipe: @recipe }
    end
  
    def new
      @recipe = Recipe.new
      render json: { recipe: @recipe }
    end
  
    def create
      @recipe = Recipe.new(recipe_params)
  
      if @recipe.save
        render json: { recipe: @recipe, notice: 'Recipe was successfully created.' }, status: :created
      else
        render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def edit
      # The @recipe variable has been set by the `set_recipe` method via before_action
      render json: { recipe: @recipe }
    end
  
    def update
      if @recipe.update(recipe_params)
        render json: { recipe: @recipe, notice: 'Recipe was successfully updated.' }
      else
        render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @recipe.destroy
      render json: { notice: 'Recipe was successfully destroyed.' }
    end
  
    private

    def check_authorization
       unless @recipe.user == current_user
       redirect_to recipes_path, alert: 'You are not authorized to perform this action.'
    end
  
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
  
    def recipe_params
      params.require(:recipe).permit(:name, :instructions, :cook_time, :ingredients, :course, :servings, :allergies, :tutorial_link, :recipe_image, :user_id, ingredient_ids: [])
    end
  end
  
class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    render json: { ingredients: @ingredients }
  end

  def show
    begin
      @ingredient = Ingredient.find(params[:id])
      render json: { ingredient: @ingredient }
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Ingredient not found' }, status: :not_found
    end
  end
end

# spec/controllers/ingredients_controller_spec.rb
require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "GET #index" do
    it "returns a list of ingredients" do
      ingredient1 = Ingredient.create(name: 'Salt')
      ingredient2 = Ingredient.create(name: 'Sugar')

      get :index
      expect(response).to have_http_status(:success)

      ingredients_response = JSON.parse(response.body)
      expect(ingredients_response['ingredients']).to be_an_instance_of(Array)
      expect(ingredients_response['ingredients'].length).to eq(2)
      expect(ingredients_response['ingredients'][0]['name']).to eq(ingredient1.name)
      expect(ingredients_response['ingredients'][1]['name']).to eq(ingredient2.name)
    end
  end

  describe "GET #show" do
    it "returns a single ingredient" do
      ingredient = Ingredient.create(name: 'Salt')

      get :show, params: { id: ingredient.id }
      expect(response).to have_http_status(:success)

      ingredient_response = JSON.parse(response.body)
      expect(ingredient_response['ingredient']['name']).to eq(ingredient.name)
    end

    it "returns an error if the ingredient does not exist" do
      get :show, params: { id: 123 }
      expect(response).to have_http_status(:not_found)

      error_response = JSON.parse(response.body)
      expect(error_response['error']).to eq('Ingredient not found')
    end
  end
end

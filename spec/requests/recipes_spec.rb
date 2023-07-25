require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe "GET /index" do
    it "gets a list of recipes" do
      user1 = User.create(email: "test1@example.com", password: "password", password_confirmation: "password")
      ingredient1 = Ingredient.create(name: 'Salt')
      
      recipe_params = {
        name: "Apple Pie",
        instructions: "bake it properly",
        cook_time: "120 Minutes",
        course: "Breakfast",
        servings: 3.5,
        allergies: "Non",
        tutorial_link: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
        recipe_image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
        ingredient_ids: [ingredient1.id] 
      }

      user1.recipes.create(recipe_params)

      get '/recipes'

      recipes = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(recipes.length).to eq 1
    end
  end

  describe 'POST /create' do

    it 'creates a recipe with an ingredient' do
      user1 = User.create(email: "test2@example.com", password: "password2", password_confirmation: "password2")
      ingredient = Ingredient.create(name: "Example Ingredient")

      recipe_params = {
        recipe: {
          name: 'Apple Pie',
          instructions: 'bake it properly',
          cook_time: '120 Minutes',
          course: 'Breakfast',
          servings: 3.5,
          allergies: 'Non',
          tutorial_link: 'https://example.com/apple-pie-tutorial',
          recipe_image: 'https://example.com/apple-pie-image',
          ingredient_ids: [ingredient.id],
          user_id: user1.id
        }
      }

     
      post '/recipes', params: recipe_params

      
      expect(response).to have_http_status(:created)

      
      recipe = JSON.parse(response.body)

     
      expect(recipe['name']).to eq('Apple Pie')
      expect(recipe['instructions']).to eq('bake it properly')
      t
      expect(recipe['ingredients'][0]['name']).to eq('Salt')
    end
  end
end

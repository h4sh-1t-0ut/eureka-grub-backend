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
      expect(recipes.length).to eq(1)
    end
  end

  describe 'POST /create' do
    it 'creates a new recipe' do
        user1 = User.create(email: 'user1@example.com', password: 'password', password_confirmation:'password')
        ingredient1 = Ingredient.create(name: 'Ingredient 1')
        user = User.first
        puts user
       
        
        post '/recipes', params: { recipe: { name: 'Newest Recipe',
        instructions: 'Cook this way...',
        cook_time: '30 minutes',
        course: 'Main Course',
        servings: 4,
        allergies: 'None',
        tutorial_link: 'https://www.google.com/',
        recipe_image: 'https://www.plannthat.com/wp-content/uploads/2017/12/instagram-food-photographers-feature.png',
        ingredients: [ingredient1.id],
        user_id: user.id

       }}

        recipe = Recipe.first

        
       
        # expect(recipe.name).to eq('Newest Recipe')
        expect(response).to have_http_status(200)

       
      end
    end
  end

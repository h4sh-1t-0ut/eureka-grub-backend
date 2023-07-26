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
    context 'with valid parameters' do
      it 'creates a new recipe' do
        user = User.create(email: 'test@example.com', encrypted_password: 'someencryptedpassword')
        ingredient1 = Ingredient.create(name: 'Ingredient 1')

        recipe_params = {
          name: 'Newest Recipe',
          instructions: 'Cook this way...',
          cook_time: '30 minutes',
          course: 'Main Course',
          servings: 4,
          allergies: 'None',
          tutorial_link: 'https://www.google.com/',
          recipe_image: 'https://www.plannthat.com/wp-content/uploads/2017/12/instagram-food-photographers-feature.png',
          ingredient_ids: [ingredient1.id],
          user_id: user.id
        }

        # Add debug output to check recipe_params
        puts "Recipe Params: #{recipe_params}"

        expect {
          post '/recipes', params: { recipe: recipe_params }
        }.to change(Recipe, :count).by(1)

        # Add debug output to check response body
        puts "Response Body: #{response.body}"

        expect(response).to have_http_status(:created)

        # Add debug output to check Recipe count after the request
        puts "Recipe Count after POST: #{Recipe.count}"
      end
    end
  end
end

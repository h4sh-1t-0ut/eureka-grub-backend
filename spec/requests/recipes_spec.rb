# spec/requests/recipes_spec.rb

require 'rails_helper'

RSpec.describe RecipesController, type: :request do
  describe 'GET #index' do
    it 'returns a list of recipes' do
      user = User.create(email: 'user1@example.com', password: 'password')
      recipe1 = Recipe.create(name: 'Recipe 1', user: user)
      recipe2 = Recipe.create(name: 'Recipe 2', user: user)

      get '/recipes'

      recipe_response = JSON.parse(response.body)
      recipes = recipe_response['recipes']

      expect(recipes.length).to eq(2)
      expect(recipes.map { |r| r['name'] }).to match_array(['Recipe 1', 'Recipe 2'])
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns a single recipe' do
      user = User.create(email: 'user1@example.com', password: 'password')
      recipe = Recipe.create(name: 'Recipe 1', user: user)

      get "/recipes/#{recipe.id}"

      recipe_response = JSON.parse(response.body)
      returned_recipe = recipe_response['recipe']

      expect(returned_recipe['name']).to eq('Recipe 1')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new recipe with ingredients' do
        user = User.create(email: 'user1@example.com', password: 'password')
        ingredient1 = Ingredient.create(name: 'Ingredient 1')
        ingredient2 = Ingredient.create(name: 'Ingredient 2')
        recipe_params = {
          name: 'New Recipe',
          instructions: 'Step 1, Step 2, Step 3...',
          cook_time: '30 minutes',
          course: 'Dessert',
          servings: 4,
          allergies: 'None',
          tutorial_link: 'https://example.com/new-recipe-tutorial',
          user_id: user.id,
          ingredient_ids: [ingredient1.id, ingredient2.id]
        }

        sign_in user

        post '/recipes', params: { recipe: recipe_params }

        recipe_response = JSON.parse(response.body)
        returned_recipe = recipe_response['recipe']

        expect(returned_recipe['name']).to eq('New Recipe')
        expect(returned_recipe['ingredients'].length).to eq(2)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid attributes' do
      it 'returns errors if recipe creation fails' do
        user = User.create(email: 'user1@example.com', password: 'password')
        invalid_recipe_params = { name: '' }

        sign_in user

        post '/recipes', params: { recipe: invalid_recipe_params }

        recipe_response = JSON.parse(response.body)
        errors = recipe_response['errors']

        expect(errors).to include("Name can't be blank")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the recipe' do
        user = User.create(email: 'user1@example.com', password: 'password')
        recipe = Recipe.create(name: 'Recipe 1', user: user)
        updated_recipe_params = { name: 'Updated Recipe' }

        sign_in user

        patch "/recipes/#{recipe.id}", params: { recipe: updated_recipe_params }

        recipe_response = JSON.parse(response.body)
        updated_recipe = recipe_response['recipe']

        expect(updated_recipe['name']).to eq('Updated Recipe')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid attributes' do
      it 'returns errors if update fails' do
        user = User.create(email: 'user1@example.com', password: 'password')
        recipe = Recipe.create(name: 'Recipe 1', user: user)
        invalid_recipe_params = { name: '' }

        sign_in user

        patch "/recipes/#{recipe.id}", params: { recipe: invalid_recipe_params }

        recipe_response = JSON.parse(response.body)
        errors = recipe_response['errors']

        expect(errors).to include("Name can't be blank")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when the user is not the recipe owner' do
      it 'returns unauthorized' do
        user = User.create(email: 'user1@example.com', password: 'password')
        other_user = User.create(email: 'user2@example.com', password: 'password')
        recipe = Recipe.create(name: 'Recipe 1', user: user)
        ingredient1 = Ingredient.create(name: 'Ingredient 1')
        ingredient2 = Ingredient.create(name: 'Ingredient 2')
        recipe.ingredients << [ingredient1, ingredient2]

        sign_in other_user

        patch "/recipes/#{recipe.id}", params: { recipe: { name: 'Updated Recipe' } }

        recipe_response = JSON.parse(response.body)
        errors = recipe_response['errors']

        expect(errors).to include('You are not authorized to perform this action.')
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the recipe' do
      user = User.create(email: 'user1@example.com', password: 'password')
      recipe = Recipe.create(name: 'Recipe 1', user: user)

      sign_in user

      delete "/recipes/#{recipe.id}"

      recipe_response = JSON.parse(response.body)

      expect(recipe_response['notice']).to eq('Recipe was successfully destroyed.')
      expect(response).to have_http_status(:ok)
      expect(Recipe.count).to eq(0)
    end

    context 'when the user is not the recipe owner' do
      it 'returns unauthorized' do
        user = User.create(email: 'user1@example.com', password: 'password')
        other_user = User.create(email: 'user2@example.com', password: 'password')
        recipe = Recipe.create(name: 'Recipe 1', user: user)

        sign_in other_user

        delete "/recipes/#{recipe.id}"

        recipe_response = JSON.parse(response.body)
        errors = recipe_response['errors']

        expect(errors).to include('You are not authorized to perform this action.')
        expect(response).to have_http_status(:unauthorized)
        expect(Recipe.count).to eq(1) # The recipe should not be deleted
      end
    end
  end
end

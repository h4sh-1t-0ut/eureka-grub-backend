require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  let(:user) { User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password') }

  describe "GET /recipes" do
    it 'gets a list of Recipes' do
      user.recipes.create(
        name: 'Classic Pancakes',
        instructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.',
        cook_time: '15 minutes',
        ingredients: 'Flour, milk, eggs, baking powder, sugar, salt',
        course: 'Breakfast',
        servings: 4,
        allergies: 'None',
        tutorial_link: 'https://example.com/classic-pancakes-tutorial',
        recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

      get '/recipes'

      recipe_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(recipe_response.length).to eq(1)
      expect(recipe_response.first['name']).to eq('Classic Pancakes')
      expect(recipe_response.first['instructions']).to eq('Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.')
      expect(recipe_response.first['cook_time']).to eq('15 minutes')
      expect(recipe_response.first['ingredients']).to eq('Flour, milk, eggs, baking powder, sugar, salt')
      expect(recipe_response.first['course']).to eq('Breakfast')
      expect(recipe_response.first['servings']).to eq(4)
      expect(recipe_response.first['allergies']).to eq('None')
      expect(recipe_response.first['tutorial_link']).to eq('https://example.com/classic-pancakes-tutorial')
      expect(recipe_response.first['recipe_image']).to eq('https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')
    end
  end

  describe "POST /recipes" do
    it 'creates a recipe' do
      recipe_params = {
        recipe: {
          name: 'Regular Pancake',
          instructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.',
          cook_time: '15 minutes',
          ingredients: 'Flour, milk, eggs, baking powder, sugar, salt',
          course: 'Breakfast',
          servings: 4,
          allergies: 'None',
          tutorial_link: 'https://example.com/regular-pancakes-tutorial',
          recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80',
          user_id: user.id
        }
      }

      post '/recipes', params: recipe_params

      expect(response).to have_http_status(201)

      recipe = Recipe.first

      expect(recipe.name).to eq('Regular Pancake')
    end
  end

  describe "PATCH /recipes/:id" do
    it 'updates a recipe' do
      recipe = user.recipes.create(
        name: 'Regular Pancake',
        instructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.',
        cook_time: '15 minutes',
        ingredients: 'Flour, milk, eggs, baking powder, sugar, salt',
        course: 'Breakfast',
        servings: 4,
        allergies: 'None',
        tutorial_link: 'https://example.com/regular-pancakes-tutorial',
        recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        
      )

      updated_attributes = {
        recipe: {
          name: 'Not a Pancake',
          instructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle. Take your time.',
          cook_time: '30minutes',
          ingredients: 'Flour, milk, eggs, baking powder, salt',
          course: 'Lunch',
          servings: 5,
          allergies: 'Dairy',
          tutorial_link: 'https://example.com/regular-pancakes-tutorial/r',
          recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80/6'
          
        }
      }

      patch "/recipes/#{recipe.id}", params: updated_attributes

      expect(response).to have_http_status(200)

      recipe.reload
      expect(recipe.name).to eq('Not a Pancake')
      expect(recipe.servings).to eq(5)
    end
  end

  describe "DELETE /recipes/:id" do
    it 'deletes a recipe' do
      recipe = user.recipes.create(
        name: 'Regular Pancake',
        instructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.',
        cook_time: '15 minutes',
        ingredients: 'Flour, milk, eggs, baking powder, sugar, salt',
        course: 'Breakfast',
        servings: 4,
        allergies: 'None',
        tutorial_link: 'https://example.com/regular-pancakes-tutorial',
        recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )
  
      expect {
        delete "/recipes/#{recipe.id}"
      }.to change(Recipe, :count).by(-1)
  
      expect(response).to have_http_status(200)
    end
  end
end
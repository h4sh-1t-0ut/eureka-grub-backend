require 'rails_helper'

RSpec.describe "Ingredients", type: :request do
  describe "GET /index" do
    it "gets a list of ingredients" do
      Ingredient.create(
        name: 'Salt'
      )

       # Make a request
       get '/ingredients'

       ingredient = JSON.parse(response.body)
       expect(response).to have_http_status(200)
       expect(ingredient.length).to eq 1
   
  end
end

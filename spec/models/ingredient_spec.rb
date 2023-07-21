require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it "should validate Ingredient name" do
  ingredient = Ingredient.create
    expect(ingredient.errors[:name]).to_not be_empty
  end
  
end

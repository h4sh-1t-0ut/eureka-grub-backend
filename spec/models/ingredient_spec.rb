# spec/models/ingredient_spec.rb
require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it 'is invalid without a name' do
    ingredient = Ingredient.new(name: nil)
    expect(ingredient).not_to be_valid
    expect(ingredient.errors[:name]).to include("can't be blank")
  end

  it 'should have many recipe_ingredients' do
    association = described_class.reflect_on_association(:recipe_ingredients)
    expect(association.macro).to eq :has_many
  end

  it 'should have many recipes through recipe_ingredients' do
    association = described_class.reflect_on_association(:recipes)
    expect(association.macro).to eq :has_many
    expect(association.options[:through]).to eq :recipe_ingredients
  end
end

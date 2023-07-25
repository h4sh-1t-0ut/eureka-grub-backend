RSpec.describe Recipe, type: :model do
  let(:user) { User.create(email: 'user@example.com', password: 'password123') }
  let(:ingredient1) { Ingredient.create(name: 'Ingredient 1') }
  let(:ingredient2) { Ingredient.create(name: 'Ingredient 2') }

  subject(:recipe) do
    Recipe.new(
      name: 'Sample Recipe',
      instructions: 'Sample instructions for the recipe.',
      cook_time: '30 minutes',
      course: 'Dessert',
      servings: 2,
      allergies: 'None',
      tutorial_link: 'https://example.com/sample-recipe-tutorial',
      recipe_image: 'https://example.com/sample-recipe-image.jpg',
      user: user
    )
  end

  before do
    recipe.ingredients << [ingredient1, ingredient2]
  end

  it 'is valid with all required attributes' do
    expect(recipe).to be_valid
  end

  it 'is invalid without a name' do
    recipe.name = nil
    expect(recipe).not_to be_valid
    expect(recipe.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without instructions' do
    recipe.instructions = nil
    expect(recipe).not_to be_valid
    expect(recipe.errors[:instructions]).to include("can't be blank")
  end

  it 'is invalid without cook_time' do
    recipe.cook_time = nil
    expect(recipe).not_to be_valid
    expect(recipe.errors[:cook_time]).to include("can't be blank")
  end

  it 'is invalid without ingredients' do
    recipe.ingredients = []
    expect(recipe).not_to be_valid
    expect(recipe.errors[:ingredients]).to include("can't be blank")
  end

  it 'is invalid without course' do
    recipe.course = nil
    expect(recipe).not_to be_valid
    expect(recipe.errors[:course]).to include("can't be blank")
  end

  it 'is invalid without servings' do
    recipe.servings = nil
    expect(recipe).not_to be_valid
    expect(recipe.errors[:servings]).to include("can't be blank")
  end

  it 'is invalid without allergies' do
    recipe.allergies = nil
    expect(recipe).not_to be_valid
    expect(recipe.errors[:allergies]).to include("can't be blank")
  end

  it 'is invalid without tutorial_link' do
    recipe.tutorial_link = nil
    expect(recipe).not_to be_valid
    expect(recipe.errors[:tutorial_link]).to include("can't be blank")
  end

  it 'is invalid without recipe_image' do
    recipe.recipe_image = nil
    expect(recipe).not_to be_valid
    expect(recipe.errors[:recipe_image]).to include("can't be blank")
  end
end

# Clear existing data (optional, use with caution)
Ingredient.destroy_all
RecipeIngredient.destroy_all
Recipe.destroy_all
User.destroy_all

# Create seed data using a do block
# Add user creation and other seed data here
# Example:

# Create Users (optional)
user1 = User.create(email: 'user1@example.com', password: 'password')
user2 = User.create(email: 'user2@example.com', password: 'password')

# Create Ingredients
ingredient1 = Ingredient.create(name: 'Ingredient 1')
ingredient2 = Ingredient.create(name: 'Ingredient 2')
ingredient3 = Ingredient.create(name: 'Ingredient 3')

# Create Recipes without triggering the validation
recipe1 = Recipe.new(
  name: 'Recipe 1',
  instructions: 'Cook this way...',
  cook_time: '30 minutes',
  course: 'Main Course',
  servings: 4.5,
  allergies: 'Gluten',
  tutorial_link: 'https://example.com/tutorial1',
  recipe_image: 'https://example.com/recipe1.jpg',
  user: user1
)

recipe2 = Recipe.new(
  name: 'Recipe 2',
  instructions: 'Cook that way...',
  cook_time: '45 minutes',
  course: 'Dessert',
  servings: 6.0,
  allergies: 'Dairy',
  tutorial_link: 'https://example.com/tutorial2',
  recipe_image: 'https://example.com/recipe2.jpg',
  user: user2
)

# Save the recipes without validation
recipe1.save(validate: false)
recipe2.save(validate: false)

# Add the ingredients to the recipes
recipe1.ingredients << [ingredient1, ingredient2]
recipe2.ingredients << [ingredient1, ingredient3]

# Additional recipe seeding as needed...

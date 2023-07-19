user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

# Assuming user1 and user2 are already created as mentioned in the previous code

# Recipe data for user1
user1_recipes = [
  {
    name: 'Classic Pancakes',
    intructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.',
    cook_time: '15 minutes',
    ingredients: 'Flour, milk, eggs, baking powder, sugar, salt',
    course: 'Breakfast',
    servings: 4,
    allergies: 'None',
    tutorial_link: 'https://example.com/classic-pancakes-tutorial',
    recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
  },
  {
    name: 'Vegetarian Pasta Primavera',
    intructions: 'Boil the pasta, sauté vegetables, and mix everything with sauce.',
    cook_time: '30 minutes',
    ingredients: 'Pasta, zucchini, broccoli, bell peppers, cherry tomatoes, Alfredo sauce',
    course: 'Dinner',
    servings: 3,
    allergies: 'None',
    tutorial_link: 'https://example.com/vegetarian-pasta-primavera-tutorial',
    recipe_image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
  }
]

# Recipe data for user2
user2_recipes = [
  {
    name: 'Grilled Chicken Salad',
    intructions: 'Grill the chicken, chop the vegetables, and toss everything together with dressing.',
    cook_time: '25 minutes',
    ingredients: 'Chicken breasts, lettuce, tomatoes, cucumbers, bell peppers, dressing',
    course: 'Lunch',
    servings: 2,
    allergies: 'None',
    tutorial_link: 'https://example.com/grilled-chicken-salad-tutorial',
    recipe_image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
  },
  {
    name: 'Chocolate Chip Cookies',
    intructions: 'Cream butter and sugar, mix in eggs and vanilla, add dry ingredients and chocolate chips, and bake the cookies.',
    cook_time: '12 minutes',
    ingredients: 'Butter, sugar, eggs, vanilla extract, flour, baking soda, salt, chocolate chips',
    course: 'Dessert',
    servings: 20,
    allergies: 'Contains dairy and gluten',
    tutorial_link: 'https://example.com/chocolate-chip-cookies-tutorial',
    recipe_image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
  }
]

# Data for user1 recipes
user1_recipes.each do |recipe|
  user1.recipes.create(recipe)
  p "created: #{recipe}"
end

# Data for user2 recipes
user2_recipes.each do |recipe|
  user2.recipes.create(recipe)
  p "created: #{recipe}"
end

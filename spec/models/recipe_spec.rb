RSpec.describe Recipe, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  it 'should validate presence of name' do
    recipe = user.recipes.create(
      instructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.',
      cook_time: '15 minutes',
      ingredients: 'Flour, milk, eggs, baking powder, sugar, salt',
      course: 'Breakfast',
      servings: 4,
      allergies: 'None',
      tutorial_link: 'https://example.com/classic-pancakes-tutorial',
      recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
    )
    expect(recipe.errors[:name]).to include("can't be blank")
  end

  it 'should validate presence of instructions' do
    recipe = user.recipes.create(
      name: 'Classic Pancakes',
      cook_time: '15 minutes',
      ingredients: 'Flour, milk, eggs, baking powder, sugar, salt',
      course: 'Breakfast',
      servings: 4,
      allergies: 'None',
      tutorial_link: 'https://example.com/classic-pancakes-tutorial',
      recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
    )
    expect(recipe.errors[:instructions]).to include("can't be blank")
  end

  it 'should validate presence of cook_time' do
    recipe = user.recipes.create(
      name: 'Classic Pancakes',
      instructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.',
      ingredients: 'Flour, milk, eggs, baking powder, sugar, salt',
      course: 'Breakfast',
      servings: 4,
      allergies: 'None',
      tutorial_link: 'https://example.com/classic-pancakes-tutorial',
      recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
    )
    expect(recipe.errors[:cook_time]).to include("can't be blank")
  end

  it 'should validate presence of ingredients' do
    recipe = user.recipes.create(
      name: 'Classic Pancakes',
      instructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.',
      cook_time: '15 minutes',
      course: 'Breakfast',
      servings: 4,
      allergies: 'None',
      tutorial_link: 'https://example.com/classic-pancakes-tutorial',
      recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
    )
    expect(recipe.errors[:ingredients]).to include("can't be blank")
  end

  it 'should validate presence of course' do
    recipe = user.recipes.create(
      name: 'Classic Pancakes',
      instructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.',
      cook_time: '15 minutes',
      ingredients: 'Flour, milk, eggs, baking powder, sugar, salt',
      servings: 4,
      allergies: 'None',
      tutorial_link: 'https://example.com/classic-pancakes-tutorial',
      recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
    )
    expect(recipe.errors[:course]).to include("can't be blank")
  end

  it 'should validate presence of servings' do
    recipe = user.recipes.create(
      name: 'Classic Pancakes',
      instructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.',
      cook_time: '15 minutes',
      ingredients: 'Flour, milk, eggs, baking powder, sugar, salt',
      course: 'Breakfast',
      allergies: 'None',
      tutorial_link: 'https://example.com/classic-pancakes-tutorial',
      recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
    )
    expect(recipe.errors[:servings]).to include("can't be blank")
  end

  it 'should validate presence of allergies' do
    recipe = user.recipes.create(
      name: 'Classic Pancakes',
      instructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.',
      cook_time: '15 minutes',
      ingredients: 'Flour, milk, eggs, baking powder, sugar, salt',
      course: 'Breakfast',
      servings: 4,
      tutorial_link: 'https://example.com/classic-pancakes-tutorial',
      recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
    )
    expect(recipe.errors[:allergies]).to include("can't be blank")
  end

  it 'should validate presence of tutorial_link' do
    recipe = user.recipes.create(
      name: 'Classic Pancakes',
      instructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.',
      cook_time: '15 minutes',
      ingredients: 'Flour, milk, eggs, baking powder, sugar, salt',
      course: 'Breakfast',
      servings: 4,
      allergies: 'None',
      recipe_image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
    )
    expect(recipe.errors[:tutorial_link]).to include("can't be blank")
  end

  it 'should validate presence of recipe_image' do
    recipe = user.recipes.create(
      name: 'Classic Pancakes',
      instructions: 'Mix the dry ingredients in one bowl and wet ingredients in another. Combine the two and cook the batter on a griddle.',
      cook_time: '15 minutes',
      ingredients: 'Flour, milk, eggs, baking powder, sugar, salt',
      course: 'Breakfast',
      servings: 4,
      allergies: 'None',
      tutorial_link: 'https://example.com/classic-pancakes-tutorial',
      )
    expect(recipe.errors[:recipe_image]).to include("can't be blank")
  end

end








 
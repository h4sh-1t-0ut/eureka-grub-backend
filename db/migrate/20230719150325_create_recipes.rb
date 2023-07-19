class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :intructions
      t.string :cook_time
      t.string :ingredients
      t.string :course
      t.float :servings
      t.string :allergies
      t.text :tutorial_link
      t.text :recipe_image
      t.integer :user_id

      t.timestamps
    end
  end
end

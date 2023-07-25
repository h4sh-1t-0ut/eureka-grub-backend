class ChangeIngredientsToArrayInRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :ingredients, :integer, array: true, default: [], using: "(string_to_array(ingredients, ','))::integer[]"

  end
end

class ChangeIngredientsColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :ingredients, :text

  end
end

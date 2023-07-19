class RenameColumnInTableName < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :intructions, :instructions
  end
end

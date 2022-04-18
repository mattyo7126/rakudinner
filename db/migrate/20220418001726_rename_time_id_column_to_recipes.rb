class RenameTimeIdColumnToRecipes < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :time_id, :cooking_time_id
  end
end

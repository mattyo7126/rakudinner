class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title,        null: false
      t.integer :cooking_time_id,     null: false
      t.integer :category_id, null: false 
      t.integer :quantity_id, null: false
      t.text :ingredients,    null: false
      t.text :process,        null: false
      t.text :point,          null: false
      t.text :extra
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end


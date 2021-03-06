class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients, id: false do |t|
      t.integer :recipe_id, null: false
      t.integer :ingredient_id, null: false
      t.string :amount
      t.integer :step
      t.timestamps null: false
    end
    add_index :recipe_ingredients, :recipe_id
    add_index :recipe_ingredients, :ingredient_id
  end
end

class RenameRecipeDescription < ActiveRecord::Migration
  def change
    rename_column :recipes, :description, :short_description
  end
end

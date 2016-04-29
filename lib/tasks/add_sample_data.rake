namespace :demo do

  desc "Add example recipes"
  task :add_sample_recipes=> [:environment] do |t, args|
    recipe = Recipe.create!({name: "Fresh Veggie Pizza", 
      short_description: "Light refreshing spring treat"})
    recipe.ingredients.create!(name: "Cream Cheese")
  end

end

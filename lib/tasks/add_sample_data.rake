namespace :demo do

  def random_int(min,max)
    min+(rand*(max-min)).floor
  end

  desc "Add example recipes"
  task :add_sample_recipes => [:environment] do |t, args|
    recipe_names = ['Rueben Sandwich','Lasagna','Pizza','Ceasar Salad','Rice Crispies','Cool Veggie Pizza']
    ingredient_names = ['Pickles','Tomatoes','Flour','Water','Butter','Potatoes','Sugar','High Fructose Corn Syrup','Salt']

    ingredients = ingredient_names.map{|name| Ingredient.create!(name: name)}

    adjectives = ['light','disgusting','refreshing','heavy','tasty']
    nouns = ['snack','dinner special','midnight snack','lunch','brunch']
    relative = ['wife','children','friends','spouse']
    feeling = ['hate','love','despise','slightly enjoy']

    recipe_names.each do |name|
      description = "A #{adjectives.sample} #{nouns.sample} that your #{relative} will be sure to #{feeling.sample}"
      recipe = Recipe.create!(name: name, short_description: description)
      puts "Added #{name}"

      ingredients.shuffle

      random_int(3,8).times do |index|
        ingredient = ingredients[index]
        recipe.recipe_ingredients.create!(ingredient: ingredient, step: index)
        puts "-#{ingredient.name}"
      end
    end
  end

end

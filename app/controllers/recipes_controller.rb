class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(:name).includes(:ingredients)
  end
end

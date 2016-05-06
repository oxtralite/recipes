class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(:name).includes(:ingredients)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(params['recipe'].permit(:name, :short_description))
    redirect_to recipes_url
  end

  private


end

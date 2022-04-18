class RecipesController < ApplicationController

  def index
  end  

  def new
    @recipe = Recipe.new
  end

  def create 
    @recipe = Recipe.new(recipes_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end  
  end

    private

    def recipes_params
      params.require(:recipe).permit(:title, :category_id, :cooking_time_id, :quantity_id, :ingredients, :process, :point, :extra)
    end
end

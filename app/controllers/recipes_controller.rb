class RecipesController < ApplicationController

  def index
    @recipes = Recipe.includes(:user).order('created_at DESC')
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

  def show
    @recipe = Recipe.find(params[:id])
  end

    private

    def recipes_params
      params.require(:recipe).permit(:image, :title, :category_id, :cooking_time_id, :quantity_id, :ingredients, :process, :point, :extra).merge(user_id: current_user.id)
    end
end

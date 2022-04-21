class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    if @recipe.user_id != current_user.id
      redirect_to root_path
    end
  end


  def update
    if @recipe.update(recipes_params)
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  def destroy
    if @recipe.user.id == current_user.id
      @recipe.destroy
      redirect_to root_path
    end
  end
    
    private

    def recipes_params
      params.require(:recipe).permit(:image, :title, :category_id, :cooking_time_id, :quantity_id, :ingredients, :process, :point, :extra).merge(user_id: current_user.id)
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
end

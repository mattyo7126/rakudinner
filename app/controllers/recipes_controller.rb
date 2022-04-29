class RecipesController < ApplicationController
  protect_from_forgery :except => [:destroy, :edit]
  before_action :authenticate_user!, except: [:index]
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
    @favorite = Favorite.new
  end

  def edit
    redirect_to root_path if @recipe.user_id != current_user.id
  end

  def update
    if @recipe.update(recipes_params)
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  def destroy
    if @recipe.user_id == current_user.id
      @recipe.destroy
      redirect_to root_path
    end
  end

  def search
    if params[:q]&.dig(:ingredients)
      squished_keywords = params[:q][:ingredients].squish
      params[:q][:ingredients_cont_any] = squished_keywords.split(' ')
    end
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result
  end

  private

  def recipes_params
    params.require(:recipe).permit(:image, :title, :category_id, :cooking_time_id, :quantity_id, :ingredients, :process,
                                   :point, :extra).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end

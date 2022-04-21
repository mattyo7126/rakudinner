class FavoritesController < ApplicationController
  def create
    @recipe_favorite = Favorite.new(user_id: current_user.id, recipe_id: params[:post_id])
    @recipe_favorite.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @recipe_favorite = Favorite.find_by(user_id: current_user.id, recipe_id: params[:recipe_id])
    @recipe_favorite.destroy
    redirect_to post_path(params[:recipe_id]) 
  end

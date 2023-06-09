class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: current_user.id)
    # @favorites = Favorite.all
    render :index
  end

  def show
    @favorite = Favorite.find_by(id: params[:id])
    render :show
  end

  def create
    @favorite = Favorite.new(
    user_id: current_user.id,
    movie_id: params[:favorite][:movie_id]
    )
    @favorite.save!
    render :show
  end


  

  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    @favorite.destroy
    render json: {message: "Favorite has been delete!"}
  end
end

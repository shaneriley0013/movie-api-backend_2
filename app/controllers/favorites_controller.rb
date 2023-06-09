class FavoritesController < ApplicationController

  def index
    if current_user.nil?
      redirect_to "/login"
    else
      @favorites = Favorite.where(user_id: current_user.id)
      render :index
    end
  end
  

  def show
    @favorite = Favorite.find_by(id: params[:id])
    render :show
  end

  def create
    if current_user.nil?
      redirect_to "/login"
    else
      @favorite = Favorite.new(
        user_id: current_user.id,
        movie_id: params[:favorite][:movie_id]
      )
      if @favorite.save!
        redirect_to "/favorites"
      end
    end
  end
  

  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    @favorite.destroy
    # render json: {message: "Favorite has been delete!"}
    redirect_to "/favorites"
  end
end

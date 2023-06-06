class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
    render :index
  end

  def show
    @favorite = Favorite.find_by(id: params[:id])
    render :show
  end

  def create
    @favorite = Favorite.new(
      name: params[:name],
      email: params[:email],
      password_digest: params[:password_digest],
      image_url: params[:image_url]
    )
    @favorite.save!
    render :show
  end

  def update
    @favorite = Favorite.find_by(id: params[:id])
    @favorite.update(
    name: params[:name] || @favorite.name,
    email: params[:email] || @favorite.email,
    password_digest: params[:password_digest] || @favorite.password_digest,
    image_url: params[:image_url] || @favorite.image_url
    )
    render :show    
  end
  

  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    @favorite.destroy
    render json: {message: "Favorite has been delete!"}
  end
end

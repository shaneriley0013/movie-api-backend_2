class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    render :index
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    render :show
  end

  def create
    @movie = Movie.new(
      name: params[:name],
      image_url: params[:image_url],
      description: params[:description],
      category: params[:category]
    )
    @movie.save!
    render :show
  end

  def update
    @movie = Movie.find_by(id: params[:id])
    @movie.update(
    name: params[:name] || @movie.name,
    image_url: params[:image_url] || @movie.image_url,
    description: params[:description] || @movie.description,
    category: params[:category] || @movie.category
    )
    render :show    
  end
  

  def destroy
    @movie = Movie.find_by(id: params[:id])
    @movie.destroy
    render json: {message: "Movie has been delete!"}
  end

end

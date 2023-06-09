class MoviesController < ApplicationController

  def index
    if params[:name].present?
      @movies = Movie.where("name iLIKE ?", "%#{params[:name]}%")
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @favorite = Favorite.new
    render :show
  end

  def create
    @movie = Movie.new(
      name: params[:name],
      image_url: params[:image_url],
      description: params[:description],
      category: params[:category],
      trailer_url: params[:trailer_url]
    )
    @movie.save!
    redirect_to "/movies/#{@movie.id}"
  end

  def edit
    @movie = Movie.find_by(id: params[:id])
    render :edit
  end

  def update
    @movie = Movie.find_by(id: params[:id])
    @movie.update(
    name: params[:name] || @movie.name,
    image_url: params[:image_url] || @movie.image_url,
    description: params[:description] || @movie.description,
    category: params[:category] || @movie.category,
    trailer_url: params[:trailer_url] || @movie.trailer_url
    )
    if @movie.save!
      redirect_to "/movies/#{@movie.id}"
    else
      render :new, status: :see_other
    end
  end
  

  def destroy
    @movie = Movie.find_by(id: params[:id])
    @movie.destroy
    # render json: {message: "Movie has been delete!"}
    redirect_to "/movies", status: :see_other
  end

end


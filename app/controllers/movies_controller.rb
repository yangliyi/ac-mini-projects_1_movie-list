class MoviesController < ApplicationController

  #GET /movies
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  #GET /movies/new
  def new
    @movie = Movie.new
  end

  #POST /movies
  def create
    @movie = Movie.new(movie_params)
    @movie.save

    redirect_to movies_url
  end

  def edit
    @movie = Movie.find( params[:id] )
  end

  def update
    @movie = Movie.find(params[:id])

    @movie.update(movie_params)

    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy

    redirect_to movies_url
  end

  private

  def movie_params
  params.require(:movie).permit(:name, :description, :category, :rating)
  end
end

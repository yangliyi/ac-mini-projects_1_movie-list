class MoviesController < ApplicationController

  #GET movies
  def index
  @movies = Movie.all
  end

  #GET movies/new
  def new
    @movie = Movie.new
  end

  def create
  @movie = Movie.new(movie_params)
  @movie.save

  redirect_to movies_url
  end

  private

  def movie_params
  params.require(:movie).permit(:name, :description)
  end
end

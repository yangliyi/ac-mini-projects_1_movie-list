class MoviesController < ApplicationController

  before_action :set_movie, :only => [ :show, :edit, :update, :destroy]
  #GET /movies
  def index
    @movies = Movie.all
  end

  def show
    @page_title = @movie.name
  end

  #GET /movies/new
  def new
    @movie = Movie.new
  end

  #POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_url
    else
      render :action => :new
    end

  end

  def edit
    @page_title = @movie.name
  end

  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :action => :edit
    end
  end

  def destroy
    @movie.destroy

    redirect_to movies_url
  end

  private

  def movie_params
  params.require(:movie).permit(:name, :description, :category, :rating)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

end

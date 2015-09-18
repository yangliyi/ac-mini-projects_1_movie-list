class MoviesController < ApplicationController

  before_action :set_movie, :only => [ :show, :edit, :update, :destroy]
  #GET /movies
  def index
    @movies = Movie.order("rating DESC").page(params[:page]).per(5)
    if params[:movie_id]
      @movie = Movie.find( params[:movie_id] )
    end
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
      flash[:notice] = "Thank you! This movie was successfully added!"
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
      flash[:notice] = "Thank you! This movie was successfully updated!"
      redirect_to movie_path(@movie)
    else
      render :action => :edit
    end
  end

  def destroy
    @movie.destroy
    flash[:alert] = "This movie was successfully deleted!"
    redirect_to :back
  end

  private

  def movie_params
  params.require(:movie).permit(:name, :description, :category, :rating)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

end

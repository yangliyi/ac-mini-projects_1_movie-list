class MoviesController < ApplicationController

  before_action :set_movie, :only => [ :show, :edit, :update, :destroy]
  #GET /movies
  def index
    @movies = Movie.order("rating DESC").page(params[:page]).per(5)
    if params[:movie_id]
      @movie = Movie.find( params[:movie_id] )
    else
      @movie = Movie.new
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
    flash[:notice] = "Thank you! This movie was successfully added!"
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_url(:page => params[:page])
    else
      render :action => :new
    end

  end

  def edit
    @page_title = @movie.name
  end

  def update
    flash[:notice] = "Thank you! This movie was successfully updated!"
    if @movie.update(movie_params)

      redirect_to movies_url(@movie, :page => params[:page])
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

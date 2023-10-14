class MovieGenresController < ApplicationController
  def show
    @movie_genre = MovieGenre.find(params[:id])
    @movies = @movie_genre.movies
    flash[:notice] = 'Gênero cadastrado com sucesso!' if params[:created].present?
    flash[:notice] = 'Gênero editado com sucesso!' if params[:updated].present?
  end

  def new
    @movie_genre = MovieGenre.new
  end

  def create
    @movie_genre = MovieGenre.new(name: params[:movie_genre][:name])
    if @movie_genre.save
      return redirect_to movie_genre_path(@movie_genre.id, created: true)
    end

    render :new
  end

  def edit
    @movie_genre = MovieGenre.find(params[:id])    
  end

  def update
    @movie_genre = MovieGenre.find(params[:id])
    if @movie_genre.update(name: params[:movie_genre][:name])
      return redirect_to movie_genre_path(@movie_genre.id, updated: true)
    end

    render :edit
  end
end
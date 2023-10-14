class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    flash[:notice] = 'Filme cadastrado com sucesso!' if params[:created].present?
    flash[:notice] = 'Filme editado com sucesso!' if params[:updated].present?
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(title: params[:movie][:title],
                      release_year: params[:movie][:release_year],
                      sinopsis: params[:movie][:sinopsis],
                      origin_country: params[:movie][:origin_country],
                      duration: params[:movie][:duration],
                      director_id: params[:movie][:director_id],
                      movie_genre_id: params[:movie][:movie_genre_id])
    if @movie.save
      return redirect_to movie_path(@movie.id, created: true)
    end

    render :new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(title: params[:movie][:title],
                  release_year: params[:movie][:release_year],
                  sinopsis: params[:movie][:sinopsis],
                  origin_country: params[:movie][:origin_country],
                  duration: params[:movie][:duration],
                  director_id: params[:movie][:director_id],
                  movie_genre_id: params[:movie][:movie_genre_id])
      return redirect_to movie_path(@movie.id, updated: true)
    end

    render :edit
  end

  def publish
    @movie = Movie.find(params[:id])
    @movie.published!
    redirect_to movie_path(@movie.id)
  end
end
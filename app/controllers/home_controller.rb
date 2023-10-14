class HomeController < ApplicationController
  def index
    @movies = Movie.published
    @movie_genres = MovieGenre.all
    @director = Director.all
  end
end
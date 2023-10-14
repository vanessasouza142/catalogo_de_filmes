class DirectorsController < ApplicationController
  def show
    @director = Director.find(params[:id])
    @movies = @director.movies
    flash[:notice] = 'Diretor cadastrado com sucesso!' if params[:created].present?
    flash[:notice] = 'Diretor editado com sucesso!' if params[:updated].present?
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(name: params[:director][:name],
                            origin_country: params[:director][:origin_country],
                            birth_date: params[:director][:birth_date],
                            favorite_genre: params[:director][:favorite_genre])
    if @director.save
      return redirect_to director_path(@director.id, created: true)
    end

    render :new
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])
    if @director.update(name: params[:director][:name],
                        origin_country: params[:director][:origin_country],
                        birth_date: params[:director][:birth_date],
                        favorite_genre: params[:director][:favorite_genre])
     return redirect_to director_path(@director.id, updated: true)
    end

    render :edit
  end
end
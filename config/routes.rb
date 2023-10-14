Rails.application.routes.draw do
  root  to: 'home#index'

  resources :movies, only: [:show, :new, :create, :edit, :update] do
    patch :publish, on: :member
  end
  resources :movie_genres, only: [:show, :new, :create, :edit, :update]
  resources :directors, only: [:show, :new, :create, :edit, :update]
end

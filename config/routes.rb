Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  post "/login", to: "users#login"

  get "/movies/:id", to: "movies#movie_rating_average"

  resources :reviews, only: [:index, :show, :create, :update, :destroy]
  resources :categories, only: [:index]
  resources :movies, only: [:index, :show]
end

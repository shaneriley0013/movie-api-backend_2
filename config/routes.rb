Rails.application.routes.draw do
   # Defines the root path route ("/")
  # root "articles#index"

  resources :movies
  post '/movies/new', to: 'movies#create'

  # get "/movies" => "movies#index"
  # get "/movies/:id" => "movies#show"
  # post "/movies/new" => "movies#new"
  # post "/movies" => "movies#create"
  # patch "/movies/:id" => "movies#update"
  # delete "/movies/:id" => "movies#destroy"
  
  get "/signup" => "users#new"
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"
  
  get "/favorites" => "favorites#index"
  get "/favorites/:id" => "favorites#show"
  post "/favorites" => "favorites#create"
  patch "/favorites/:id" => "favorites#update"
  delete "/favorites/:id" => "favorites#destroy"

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

end
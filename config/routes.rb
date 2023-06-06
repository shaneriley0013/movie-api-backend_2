Rails.application.routes.draw do
   # Defines the root path route ("/")
  # root "articles#index"

  get "/movies" => "movies#index"
  get "/movies/:id" => "movies#show"
  post "/movies" => "movies#create"
  patch "/movies/:id" => "movies#update"
  delete "/movies/:id" => "movies#destroy"


# resources :movies


end

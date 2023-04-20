Rails.application.routes.draw do
  root "trainers#index"
  post "/", to: "articles#authenticate"

  resources :pokemons do
    get "/discover" to: "pokemons/discover"
  end
  resources :trainers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end

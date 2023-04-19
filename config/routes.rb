Rails.application.routes.draw do
  root "trainers#login"
  post "/", to: "articles#authenticate"

  resources :pokemons
  resources :trainers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end

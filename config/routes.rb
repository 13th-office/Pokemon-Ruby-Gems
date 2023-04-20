Rails.application.routes.draw do
  root "trainers#index"
  get "/pokemons/discover", to: "pokemons#discover"
  post "/pokemon/create/:name/:expected_name/p_id", to: "pokemons#createPokemon", as:'create-pokemon'
  resources :pokemons
  resources :trainers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end

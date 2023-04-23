Rails.application.routes.draw do
  root "trainers#index"
  get "/pokemons/discover", to: "pokemons#discover"
  post "/pokemon/create/:order/:expected_name", to: "pokemons#createPokemon", as:'create-pokemon'
  get "/select_pokemon/:trainer_id", to: "pokemons#select_pokemon", as:'select_pokemon'
  post "/pokemons/add_pokemon/:trainer_id/:pokemon_id", to: "pokemons#add_pokemon", as:'add_pokemon'
  resources :pokemons
  resources :trainers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end

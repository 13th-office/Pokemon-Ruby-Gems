Rails.application.routes.draw do
  root "static_pages#home"
  
  post "/create_user", to: "users#create"
  get "/sign_up", to: "users#new"

  post "/login", to: "sessions#create"
  get "/login", to: "sessions#new"

  get "/signin", to: "sessions#new"
  get "/pokemons/discover", to: "pokemons#discover"
  post "/pokemon/create/:order/:expected_name", to: "pokemons#createPokemon", as:'create-pokemon'
  get "/select_pokemon/:trainer_id", to: "pokemons#select_pokemon", as:'select_pokemon'
  post "/pokemons/add_pokemon/:trainer_id/:pokemon_id", to: "pokemons#add_pokemon", as:'add_pokemon'
  resources :pokemons
  resources :trainers




  delete "logout", to: "sessions#destroy"

  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token

end

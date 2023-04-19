class Trainer < ApplicationRecord
    has_many :pokedexes
    has_many :pokemons, through: :pokedexes
end

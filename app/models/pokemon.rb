class Pokemon < ApplicationRecord
    has_many :pokedexes
    has_many :trainers, through: :pokedexes
end

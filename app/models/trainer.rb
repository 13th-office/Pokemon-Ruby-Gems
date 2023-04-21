class Trainer < ApplicationRecord
    validates :name, presence: true, length: {minimum: 3}
    has_many :pokemons, through: :pokedexes
    validates_uniqueness_of :name
end

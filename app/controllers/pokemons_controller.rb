require 'poke-api-v2'

class PokemonsController < ApplicationController
    def discover
        order_number = rand(1..1010)
        while (Pokemon.find_by(p_id: order_number)) != nil
            order_number = rand(1..1010)
        end
        @pokemon = PokeApi.get(pokemon: order_number)
        @guess = GuessPokemon.new
    end

    def createPokemon
        expected_name = params[:expected_name]
        name = params[:guess_pokemon][:name]
        order = params[:order]
        if name == expected_name
            pokemon = Pokemon.new(name: name, p_id: order)
            if pokemon.save 
                redirect_to pokemon
            end
        end
    end

    def show
        poke = Pokemon.find(params[:id])
        @pokemon = PokeApi.get(pokemon: poke.name)
    end

    def select_pokemon
        @trainer = params[:trainer_id]
        puts @trainer
        @pokemons = Pokemon.where.not(id: OwnsPokemon.select("pokemon_id").where(trainer_id: @trainer))
        puts @pokemons
    end

    def add_pokemon
        trainer = params[:trainer_id]
        pokemon = params[:pokemon_id]
        owns = OwnsPokemon.new(trainer_id: trainer, pokemon_id: pokemon)

        if owns.save
            redirect_to trainers_url(trainer)
        end

    end
end

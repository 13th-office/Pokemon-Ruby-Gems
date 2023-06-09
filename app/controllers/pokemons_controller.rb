require 'poke-api-v2'

class PokemonsController < ApplicationController
    before_action :redirect_if_authenticated

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
            puts "Yei"
            pokemon = Pokemon.find_by(name: name, p_id: order)
            if pokemon.blank?
                puts "No"
                pokemon = Pokemon.new(name: name, p_id: order)
                if !pokemon.save 
                    return
                end
            end
            trainer = Trainer.find_by(email: Current.user.email)
            p trainer
            owns = OwnsPokemon.new(trainer_id: trainer.id, pokemon_id: pokemon.id)
            if owns.save
                redirect_to pokemon
            end
        end
            
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        @pokeApi = PokeApi.get(pokemon: @pokemon.name)
    end

    def select_pokemon
        @trainer = params[:trainer_id]
        @pokemons = Pokemon.where.not(id: OwnsPokemon.select("pokemon_id").where(trainer_id: @trainer))
    end

    def add_pokemon
        trainer = params[:trainer_id]
        pokemon = params[:pokemon_id]
        owns = OwnsPokemon.new(trainer_id: trainer, pokemon_id: pokemon)

        if owns.save
            redirect_to trainer_url(trainer)
        # else
        #     render :select_pokemon, status: :unprocessable_entity
        end

    end
end
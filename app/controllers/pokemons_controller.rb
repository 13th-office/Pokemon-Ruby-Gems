require 'poke-api-v2'

class PokemonsController < ApplicationController
    def discover
        order_number = rand(1..1010)
        while (Pokemon.find_by(p_id: order_number)) != nil
            order_number = rand(1..1010)
        end
        @pokemon = PokeApi.get(pokemon: order_number)
        @guess = ""
    end

    def createPokemon
        expected_name = params[:expected_name]
        name = params[:name]
        order = params[:order]
        puts name
    end

    def show
        poke = Pokemon.find(params[:id])
        @pokemon = PokeApi.get(pokemon: poke.name)
    end
end

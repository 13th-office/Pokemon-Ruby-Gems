class TrainersController < ApplicationController
    def login
    end

    def index
        @trainers = Trainer.where("id != 1")
        @pokemons = Pokemon.all()
    end

    def show
        @trainer = Trainer.find(params[:id])
        @owned_pokemons = Pokemon.where(id:OwnsPokemon.select("pokemon_id").where(trainer_id:2)) 
    end
end

class TrainersController < ApplicationController
    def login
    end

    def index
        @trainers = Trainer.where("id != 1")
        @pokemons = Pokemon.all
        
    end
end

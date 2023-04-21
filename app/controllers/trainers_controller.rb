class TrainersController < ApplicationController
    def login
    end

    def index
        @trainers = Trainer.where("id != 1")
        @pokemons = Pokemon.all()
    end
    
    def new
        @trainer = Trainer.new
    end
    
    def show
        @trainer = Trainer.find(params[:id])
        @owned_pokemons = Pokemon.where(id:OwnsPokemon.select("pokemon_id").where(trainer_id:params[:id])) 
    end

    def create
        @trainer = Trainer.new(trainer_params)
        if @trainer.save
            redirect_to @trainer
        else
            render :new, status: :unprocessable_entity
        end 
    end

    private
    def trainer_params
      params.require(:trainer).permit(:name)
    end
end

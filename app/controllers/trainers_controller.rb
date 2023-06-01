class TrainersController < ApplicationController
    before_action :redirect_if_authenticated


    def login
    end

    def index
        puts "hi"
        puts Current.user.email
        @trainers = Trainer.where.not(email: Current.user.email)
        @pokemons = Pokemon.where(id:OwnsPokemon.select("pokemon_id").where(trainer_id: Trainer.find_by(email: Current.user.email)))
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

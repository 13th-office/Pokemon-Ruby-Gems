class TrainersController < ApplicationController
    def login
    end

    def authenticate
        @trainer = Trainer.new(:name,:password)
        if @trainer.save
            redirect_to @trainer
        end
    end
end

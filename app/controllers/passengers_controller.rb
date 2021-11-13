class PassengersController < ApplicationController
    def new
        @passenger = Passenger.new
    end

    def create
        @passenger = Passenger.new(passenger_params)

        if @passenger.save
            redirect_to root
        else
            render :new
        end
    end

    private
    def passenger_params
        params.require(:passenger).permit(:id, :name, :email)
    end
end

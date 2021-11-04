class FlightsController < ApplicationController

    def index
        @flights = Flight.all.order("start_datetime")
        @search = params["search"]
        if @search.present?
            @dep_airport = @search["departure_airport"]
            @arr_airport = @search["arriving_airport"]
            @dep_id = Airport.find_by_code(@dep_airport).id
            @arr_id = Airport.find_by_code(@arr_airport).id
            @start_datetime = @search[:date]
            @searched_flights = Flight.where(dep_airport_id:@dep_id, arr_airport_id: @arr_id) 
        end
    end

    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private 
    def flight_params
        params.require(:flight).permit(:dep_airport_id, :arr_airport_id, :start_datetime, :duration)
    end
end

class FlightsController < ApplicationController

    def index
        
        @search = params["search"]
        # debugger
        if @search.present?
            @dep_airport = @search["dep_airport_id"]
            @arr_airport = @search["arr_airport_id"]
            @start_datetime = @search[:date]
            @searched_flights = Flight.where(dep_airport_id:@dep_airport, arr_airport_id: @arr_airport)
        else
            @flights = Flight.limit(10).order("start_datetime")
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
        params.require(:flight).permit(:dep_airport_id, :arr_airport_id, :start_datetime, :duration, :search)
    end
end

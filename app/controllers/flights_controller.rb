class FlightsController < ApplicationController

    def index
        @search = params["search"]
        if @search.present?
            dep_airport_id = @search["dep_airport_id"]
            arr_airport_id = @search["arr_airport_id"]
            day = @search["start_datetime(3i)"]
            month = @search["start_datetime(2i)"]
            year = @search["start_datetime(1i)"]
            start_datetime = (year+"/"+month+"/"+day).to_date
            @num_of_passengers = @search[:num_of_passengers]
            @searched_flights = Flight.where(dep_airport_id:dep_airport_id, arr_airport_id: arr_airport_id, start_datetime: start_datetime.all_day)
        else
            @flights = Flight.limit(10).order("start_datetime desc")
        end

    end

    def show
        @flight = Flight.find(params[:id])
        @num_of_passengers = @num_of_passengers
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
        params.require(:flight).permit(:dep_airport_id, :arr_airport_id, :start_datetime, :duration, :search, :num_of_passengers)
    end
end

class FlightsController < ApplicationController

    def index
        # @searched = false
        @search = params["search"]
        # debugger
        if @search.present?
            # @searched = true
            dep_airport = @search["dep_airport_id"]
            arr_airport = @search["arr_airport_id"]
            num_of_passengers = @search["num_of_passengers"]
            
            day = @search["start_datetime(3i)"]
            month = @search["start_datetime(2i)"]
            year = @search["start_datetime(1i)"]
            start_datetime = (year+"/"+month+"/"+day).to_date
            @flights = Flight.where(dep_airport_id:dep_airport, arr_airport_id: arr_airport, start_datetime: start_datetime.all_day)
            # @searched = false

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
        params.require(:flight).permit(:dep_airport_id, :arr_airport_id, :start_datetime, :duration, :search, :num_of_passengers)
    end
end

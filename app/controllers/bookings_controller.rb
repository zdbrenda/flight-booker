class BookingsController < ApplicationController
    def index
        @bookings = Booking.all
    end

    def show
    end

    def new
        @flight = Flight.find(params[:flight_id])
        @num_of_passengers = @flight.num_of_passengers
        @booking = @flight.bookings.build
        
        debugger
    end

    def create
        @booking = Flight.bookings.build(booking_params)
        if @booking.save
            redirect_to @booking
        else
            render :new
        end
    end

    def create_with_num_of_passengers
        @num_of_passengers = params[:num_of_passengers]
        create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def booking_params
        params.require(:booking).permit(:flight, :passenger, :num_of_passengers)
    end

end

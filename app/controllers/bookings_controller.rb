class BookingsController < ApplicationController
    def index
        @bookings = Booking.all
    end

    def show
        @booking = Booking.find(params[:id])

    end

    def new
        @flight = Flight.find(params[:flight_id])
        @booking = @flight.bookings.build
        @num_of_passengers = params["num_of_passengers"].to_i
        @num_of_passengers.to_i.times { @booking.passengers.build}
    end

    def create
        @flight = Flight.find(params[:flight_id])
        @booking = @flight.bookings.build(booking_params)
        if @booking.save
            PassengerMailer.confirm_email(@booking)
            redirect_to @booking
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def booking_params
        params.require(:booking).permit(
            :flight, 
        passengers_attributes: [:id, :name, :email, :_destroy])
    end

end

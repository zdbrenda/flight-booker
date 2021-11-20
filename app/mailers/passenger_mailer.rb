class PassengerMailer < ApplicationMailer

    default from: "notification@example.com"
    def self.confirm_email(booking)
        @booking = booking
        @passengers = @booking.passengers
        @flight = @booking.flight
        @dep_airport = @flight.dep_airport.code
        @arr_airport = @flight.arr_airport.code
        @start_datetime = @flight.start_datetime
        
        @passengers.each do |passenger|
            
            # mail(to: passenger.email, subject: "Confirmation of Flight Booking")g
            PassengerMailer.new_passenger(passenger.email, booking).deliver_now
        end
    end

    def new_passenger(email, booking)
        @booking = booking
        @flight = @booking.flight
        @dep_airport = @flight.dep_airport.code
        @arr_airport = @flight.arr_airport.code
        @start_datetime = @flight.start_datetime
        mail(to: email, subject: "Confirmation of Flight Booking")
    end
end

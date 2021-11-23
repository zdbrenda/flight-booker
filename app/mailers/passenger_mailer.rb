class PassengerMailer < ApplicationMailer

    default from: "zdbrenda@gmail.com"
    def self.confirm_email(booking)
        @booking = booking
        @passengers = @booking.passengers
        @flight = @booking.flight
        @dep_airport = @flight.dep_airport.code
        @arr_airport = @flight.arr_airport.code
        @start_datetime = @flight.start_datetime
        
        @passengers.each do |passenger|
            
            PassengerMailer.new_passenger(passenger.email, passenger.name, booking).deliver_now
        end
    end

    def new_passenger(email, name, booking)
        @booking = booking
        @flight = @booking.flight
        @name = name
        @dep_airport = @flight.dep_airport.code
        @arr_airport = @flight.arr_airport.code
        @start_datetime = @flight.start_datetime
        mail(to: email, subject: "Confirmation of Flight Booking")
    end
end

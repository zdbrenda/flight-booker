# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
    def confirm_email
        booking = Booking.last
        PassengerMailer.confirm_email(booking)
    end

end

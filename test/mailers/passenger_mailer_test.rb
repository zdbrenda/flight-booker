require "test_helper"

class PassengerMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  def confirm
    PassengerMailer.confirm(Booking.find(6))
  end
end

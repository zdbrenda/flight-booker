class Passenger < ApplicationRecord
    belongs_to :booking, inverse_of: :passengers

    validates :name, presence: true
    validates :email, presence: true
end

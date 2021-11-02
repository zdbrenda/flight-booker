class Flight < ApplicationRecord
  belongs_to :dep-airport
  belongs_to :arr-airport
end

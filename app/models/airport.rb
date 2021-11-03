class Airport < ApplicationRecord
    has_many :departing_flights,    class_name: "Flight",      foreign_key: "dep_airport_id"
    has_many :arriving_flights,     class_name: "Flight",      foreign_key: "arr_airport_id"
end

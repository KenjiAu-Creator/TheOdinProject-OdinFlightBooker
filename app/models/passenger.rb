class Passenger < ApplicationRecord
    has_many :bookedFlights, :class_name => "Booking", foreign_key: "booking_id"
end

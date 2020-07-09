class Passenger < ApplicationRecord
    has_many :bookedFlights, :class_name => "Booking", foreign_key: "id"

    belongs_to :booking
end

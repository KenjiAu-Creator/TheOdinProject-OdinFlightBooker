class Airport < ApplicationRecord
    has_many :departingFlights, :class_name => "Flight", foreign_key: "startId"
    has_many :arrivingFlights, :class_name => "Flight", foreign_key: "destinationId"
end

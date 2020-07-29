class Flight < ApplicationRecord
    # belongs_to :airport, foreign_key: "startId"
    belongs_to :toAirport, :class_name => "Airport", foreign_key: "destinationId"
    belongs_to :fromAirport, :class_name => "Airport", foreign_key: "startId"

    has_many :bookings

    def self.search(departId, destinationId, flightDate)
        if ((departId && destinationId) && flightDate)
          possibleFlight = Flight.where(:startId => departId, :destinationId => destinationId, :date => flightDate)
          return possibleFlight
        end
      end
end

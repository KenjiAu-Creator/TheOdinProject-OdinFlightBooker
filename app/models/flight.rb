class Flight < ApplicationRecord
    # belongs_to :airport, foreign_key: "startId"
    belongs_to :toAirport, :class_name => "Airport", foreign_key: "startId"
    belongs_to :fromAirport, :class_name => "Airport", foreign_key: "destinationId"
end

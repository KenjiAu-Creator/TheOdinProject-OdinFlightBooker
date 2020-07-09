class Booking < ApplicationRecord
    has_many :passengers
    # :class_name => "passengers", foreign_key: "passenger_id"

    belongs_to :flight
    
    accepts_nested_attributes_for :passengers
end

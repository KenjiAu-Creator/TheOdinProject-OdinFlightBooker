class Flight < ApplicationRecord
    belongs_to :airport, foreign_key: "startId"
end

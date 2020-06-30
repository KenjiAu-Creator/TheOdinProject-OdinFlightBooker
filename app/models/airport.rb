class Airport < ApplicationRecord
    has_many :flights, foreign_key: "startId"
end

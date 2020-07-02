# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # Airports
    Airport.delete_all
    Airport.create(code: "SFO")
    Airport.create(code: "NYC")
    Airport.create(code: "LAX")
    Airport.create(code: "ORD")
    Airport.create(code: "DFW")
    Airport.create(code: "DEN")
    Airport.create(code: "SEA")
    Airport.create(code: "PHX")
    Airport.create(code: "MIA")
    Airport.create(code: "BOS")

  # Flights
    Flight.delete_all
    for i in 0..10 do
      random1 = rand(1..10)
      random2 = rand(1..10)
      Flight.create(startId: random1, 
                    destinationId: random2, 
                    flightDuration: "09:00", 
                    fromAirport: Airport.find(random1), 
                    toAirport: Airport.find(random2),
                    arrivalTime: "12:00",
                    departTime: "21:00",)
    end


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
  # Ideally create a rand(0..23) for arrival and depart.
  # Input into string with the variable at the start
  # Subtract Arrival from depart (Use abs) to get flight duration
  # Input into another string
  
    for i in 0..100 do
      random1 = rand(1..10)
      random2 = rand(1..10)
      random3 = rand(1..24)
      random4 = rand(1..24)

      if random3 < 10
        arrival = "0#{random3}:00"
      else
        arrival = "#{random3}:00"
      end

      if random4 < 10
        depart = "0#{random4}:00"
      else
        depart = "#{random4}:00"
      end

      duration = (random3 - random4).abs

      if duration < 10
        durationTime = "0#{duration}:00"
      else
        durationTime = "#{duration}:00"
      end
      
      Flight.create(startId: random1, 
                    destinationId: random2, 
                    flightDuration: durationTime, 
                    fromAirport: Airport.find(random1), 
                    toAirport: Airport.find(random2),
                    arrivalTime: arrival,
                    departTime: depart,)
    end


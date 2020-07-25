# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # Airports
    Airport.delete_all
    Airport.create(code: "SFO", name: "San Franciso")
    Airport.create(code: "NYC", name: "New York")
    Airport.create(code: "LAX", name: "Los Angeles")
    Airport.create(code: "ORD", name: "Chicago")
    Airport.create(code: "DFW", name: "Dallas")
    Airport.create(code: "DEN", name: "Denver")
    Airport.create(code: "SEA", name: "Seattle")
    Airport.create(code: "PHX", name: "Phoenix")
    Airport.create(code: "MIA", name: "Misami")
    Airport.create(code: "BOS", name: "Boston")

  # Flights
    Flight.delete_all
  # Ideally create a rand(0..23) for arrival and depart time.
  # Input into string with the variable at the start
  # Subtract Arrival from depart (Use abs) to get flight duration
  # Input into another string
  
  currentTime = Time.now
  currentYear = currentTime.year
  currentMonth = currentTime.month
  currentDay = currentTime.day

    for i in 0..100 do
      # Random Airport
      random1 = rand(1..10)
      random2 = rand(1..10)
      
      # Make sure that arrival airport is not the same as depart
      if random1 == random2
        next
      end

      # Random Airport depart / arrival time
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

      # Random date for the flight
      randMonth = rand(currentMonth..12)
      randDay = rand(1..30)

      # Make sure that the flight date is not in the past
      if randMonth < currentMonth
        next
      elsif randMonth == currentMonth && randDay < currentDay
        next
      end

      flightDate = Time.new(currentYear, randMonth, randDay)
      date = flightDate.strftime("%B, %Y, %d")
      
      Flight.create(startId: random1, 
                    destinationId: random2, 
                    flightDuration: durationTime, 
                    fromAirport: Airport.find(random1), 
                    toAirport: Airport.find(random2),
                    arrivalTime: arrival,
                    departTime: depart,
                    date: date)
    end


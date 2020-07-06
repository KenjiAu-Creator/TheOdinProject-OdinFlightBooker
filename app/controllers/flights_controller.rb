class FlightsController < ApplicationController
    def index
      @airports = Airport.all
      @airportOptions = Airport.all.map { |a| [a.code, a.id] }
      @numOfPassengers = {
          "1" => 1,
          "2" => 2,
          "3" => 3,
          "4" => 4,
          "5" => 5,
          "6" => 6,
          "7" => 7,
          "8" => 8,
          "9" => 9,
      }
      @possibleFlights = Flight.search(params[:arrivalId],params[:departId]).all.to_a
    end
   
    private

    def possibleFlights_params
      params.require(:possibleFlights).permit(:arrivalId, :departId)
    end
end

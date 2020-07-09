class FlightsController < ApplicationController
    def index
      @airports = Airport.all
      @airportOptions = Airport.all.map { |a| [a.code, a.id] }
      @numOfPassengers = {
          "1" => 1,
          "2" => 2,
          "3" => 3,
          "4" => 4,
      }
      @possibleFlights = Flight.search(params[:arrivalId],params[:departId])
      
      @booking = Booking.new
    end
   
    private

    def possibleFlights_params
      params.require(:possibleFlights).permit(:arrivalId, :departId)
    end
end

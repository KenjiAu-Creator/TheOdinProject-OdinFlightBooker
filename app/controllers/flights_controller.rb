class FlightsController < ApplicationController
    def index
      @airports = Airport.all
      @airportOptions = Airport.all.map { |a| [a.code, a.id] }

      @possibleFlights = Flight.search(params[:arrivalId],params[:departId])
    end
   
    private

    def possibleFlights_params
      params.require(:possibleFlights).permit(:arrivalId, :departId)
    end
end

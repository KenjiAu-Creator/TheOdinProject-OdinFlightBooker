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

      # The flight will only search if the flight date and airports are selected
      if !params[:flightDate].nil?
        @flightYear = params[:flightDate]["GET(1i)"].to_i
        @flightMonth = params[:flightDate]["GET(2i)"].to_i
        @flightDay = params[:flightDate]["GET(3i)"].to_i
        @possibleFlightDate = Date.new(@flightYear, @flightMonth, @flightDay).strftime("%B %d, %Y")
      end

      @possibleFlights = Flight.search(params[:departId], params[:destinationId], @possibleFlightDate)
      @booking = Booking.new
      
    end
   
    private

    def possibleFlights_params
      params.require(:possibleFlights).permit(:arrivalId, :departId, @possibleFlightDate)
    end
end

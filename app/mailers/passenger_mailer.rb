class PassengerMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def thank_you_email
        # Need to link the correct passenger still
        @passenger = Booking.last.passengers.first
        @passengers = Booking.last.passengers
        @booking = Booking.last
        @flight = Flight.find(@booking.flight_id)
        @departAirport = Airport.find(@flight.startId)
        @destinationAirport = Airport.find(@flight.destinationId)
        
        @url = 'http://example.com/login'
        mail(to: @passenger.email, subject: 'Thank you for booking with OdinFlights')
    end
end

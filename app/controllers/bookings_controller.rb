class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = current_flight.bookings.build
    @numOfPass = params["numOfPass"]
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    # We are creating a booking based on the flight chosen.
    @booking = current_flight.bookings.create
    # Save each passenger that was created
    booking_params["passengerList"].each_pair do |passenger, info|
      @passenger = @booking.passengers.create(info)
    end

    # @passenger = @booking.passengers.build(booking_params["passenger"])

    # @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        PassengerMailer.with(passenger: @passenger).thank_you_email.deliver_now
        
        format.html { redirect_to @booking, notice: 'Booking was successfully created. Confirmation E-mail has been sent.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      # params.fetch(:booking, {})
      # params.require(:flight).permit(:get)
      params.require(:booking).permit(:flightId,
                                      passenger_attributes: [:name, :email],
                                      passengerList: [
                                        passenger1: [:name, :email],
                                        passenger2: [:name, :email],
                                        passenger3: [:name, :email],
                                        passenger4: [:name, :email]
                                      ]
                                    )
    end

    def current_flight
      if !params[:flightData].nil?
        flightId = params[:flightData]["flightId"]
        flight = Flight.find(flightId)
      else
        flightId = params["booking"]["flightId"]
        flight = Flight.find(flightId)
      end
    end
end

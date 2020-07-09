class PassengersController < ApplicationController
    before_action :set_passenger, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @passengers = Passenger.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @passenger = Passenger.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @passenger = Passenger.new(passenger_params)

    respond_to do |format|
      if @passenger.save
        
        format.html { redirect_to @passenger, notice: 'Passenger was successfully created.' }
        format.json { render :show, status: :created, location: @passenger }
      else
        format.html { render :new }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @passenger.update(passenger_params)
        format.html { redirect_to @passenger, notice: 'passenger was successfully updated.' }
        format.json { render :show, status: :ok, location: @passenger }
      else
        format.html { render :edit }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passengers/1
  # DELETE /passengers/1.json
  def destroy
    @passenger.destroy
    respond_to do |format|
      format.html { redirect_to passengers_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def passenger_params
    params.fetch(:passenger, {})
  end

end

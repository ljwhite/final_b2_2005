class FlightpassengersController < ApplicationController

  def create
    passenger = Passenger.find(params[:passenger_id])
    flight = Flight.find_by(number: params[:number])
    FlightPassenger.create(flight: flight, passenger: passenger)
    redirect_to "/passengers/#{passenger.id}"
  end

end

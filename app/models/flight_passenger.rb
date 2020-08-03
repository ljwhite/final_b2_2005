class FlightPassenger < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger

  validates_presence_of :flight_id, :passenger_id
end

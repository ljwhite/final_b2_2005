class Airline < ApplicationRecord
  has_many :flights
  has_many :flight_passengers, through: :flights

  validates_presence_of :name
end

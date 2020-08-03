class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  validates_presence_of :number,
                        :date,
                        :time,
                        :arrival,
                        :departure

  def count_of_minors
    passengers.where("age < ?", 18).count
  end

  def count_of_adults
    passengers.where("age >= ?", 18).count
  end

end

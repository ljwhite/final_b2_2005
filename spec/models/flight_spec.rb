require 'rails_helper'

describe Flight, type: :model do
  describe 'validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :departure}
    it {should validate_presence_of :arrival}
  end

  describe 'relationships' do
    it {should belong_to :airline}
    it {should have_many :flight_passengers}
    it {should have_many(:passengers).through(:flight_passengers)}
  end

  describe 'instance methods' do
    before :each do
      @airline = Airline.create(name: "Southwest")
      @flight1 = @airline.flights.create(number: 101, date: "08/03/20", time: "3:30pm MT", departure: "Denver", arrival: "Dallas")
      @passenger1 = Passenger.create!(name: "Time", age: 16)
      @passenger2 = Passenger.create!(name: "Meg", age: 15)
      @passenger3 = Passenger.create!(name: "Monica", age: 52)
      @passenger4 = Passenger.create!(name: "Joe", age: 50)

      FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
      FlightPassenger.create!(flight: @flight1, passenger: @passenger2)
      FlightPassenger.create!(flight: @flight1, passenger: @passenger3)
      FlightPassenger.create!(flight: @flight1, passenger: @passenger4)
    end

    it "count_of_minors" do
      expect(@flight1.count_of_minors).to eq(2)
    end

    it "count of adults" do
      expect(@flight1.count_of_adults).to eq(2)
    end
  end
end

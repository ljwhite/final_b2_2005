require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the flight show page' do
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

    it 'I see all of that flight information' do
      visit "/flights/#{@flight1.id}"

      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@flight1.date)
      expect(page).to have_content(@flight1.time)
      expect(page).to have_content(@flight1.departure)
      expect(page).to have_content(@flight1.arrival)
    end

    it 'I also see the airline and a list of all passengers on the flight' do
      visit "/flights/#{@flight1.id}"

      expect(page).to have_content(@airline.name)
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)
    end
  end
end

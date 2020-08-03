require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a passenger show page' do
    before :each do
      @airline = Airline.create(name: "Southwest")
      @flight1 = @airline.flights.create(number: 101, date: "08/03/20", time: "3:30pm MT", departure: "Denver", arrival: "Dallas")
      @flight2 = @airline.flights.create(number: 102, date: "08/04/20", time: "8:15pm CT", departure: "Dallas", arrival: "Los Angeles")
      @flight3 = @airline.flights.create(number: 103, date: "08/05/20", time: "10:00pm PT", departure: "Los Angeles", arrival: "San Francisco")
      @passenger1 = Passenger.create!(name: "Time", age: 16)

      FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
      FlightPassenger.create!(flight: @flight2, passenger: @passenger1)
      FlightPassenger.create!(flight: @flight3, passenger: @passenger1)
    end

    it "I see that passenger name and all flight numbers associated with that passenger" do
      visit "/passengers/#{@passenger1.id}"
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@flight2.number)
      expect(page).to have_content(@flight3.number)
    end

    it "each flight number are links to the flight show page" do
      visit "/passengers/#{@passenger1.id}"
      expect(page).to have_link(@flight1.number)
      click_on "#{@flight1.number}"
      expect(current_path).to eq("/flights/#{@flight1.id}")
    end
  end
end

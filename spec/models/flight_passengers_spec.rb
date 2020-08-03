require 'rails_helper'

describe FlightPassenger, type: :model do
  describe "validations" do
    it {should validate_presence_of :flight_id}
    it {should validate_presence_of :pasenger_id}
  end

  describe  'relationships' do
    it {should belong_to :flight}
    it {should belong_to :passenger}
  end
end

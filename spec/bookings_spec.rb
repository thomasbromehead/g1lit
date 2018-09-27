require 'rspec'
require_relative 'path/to/file/model/booking.rb'

describe Booking do
  before {@booking = Booking.new()}
  it "should create a new booking" do
    expect(something).to eq expected_result
  end
end

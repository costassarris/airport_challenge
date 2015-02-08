require 'airport'
require 'plane'

describe Airport do
let(:airport) {Airport.new}
let(:plane) {Plane.new}

def fill_airport
  airport.capacity.times {airport.request_to_land(plane)}
end

context 'taking off and landing' do
  it 'a plane can land' do
    expect(plane.flying?).to eq true
    expect(airport.plane_count).to eq(0)
    airport.request_to_land(plane)
    expect(plane.flying?).to eq false
    expect(airport.plane_count).to eq(1)
  end

  it 'a plane can take off' do
    airport.request_to_land(plane)
    airport.request_to_takeoff(plane)
    expect(plane.flying?).to eq true
    expect(airport.plane_count).to eq(0)
  end
end

context 'traffic control' do
  it 'airport knows when it is full' do
    expect(airport).not_to be_full
    fill_airport
    expect(airport).to be_full
  end

  it 'a plane cannot land if the airport is full' do
    fill_airport
    expect{airport.request_to_land(plane)}.to raise_error(RuntimeError, 'Airport is full')
  end
end

end
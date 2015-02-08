require 'airport'
require 'plane'

describe Airport do
let(:airport) {Airport.new}
let(:plane) {Plane.new}

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

end
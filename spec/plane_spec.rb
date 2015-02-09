require 'plane'

describe Plane do

  let(:plane) {Plane.new}
  let(:airport) {double :airport}

  it 'is flying when created' do
    expect(plane).to be_flying
  end

  it 'is not flying when landed' do
    plane.land!
    expect(plane).not_to be_flying
  end

  it'can take off' do
    plane.land!
    plane.takeoff!
    expect(plane).to be_flying
  end

  it 'can land in the airport' do
    expect(airport).to receive(:permission_to_land).with(plane)
    plane.request_to_land(airport)
    expect(plane).not_to be_flying
  end

end
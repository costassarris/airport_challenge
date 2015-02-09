require 'airport'
require 'plane'

describe Airport do

  let(:airport) {Airport.new}
  let(:flying_plane) {double :plane, flying?: true}
  let(:landed_plane) {double :plane, flying?: false}


  def fill_airport
    airport.capacity.times {airport.permission_to_land(landed_plane)}
  end

  context 'taking off and landing' do
    it 'a plane can land' do
      allow(airport).to receive(:weather_status) {"sunny"}
      expect(flying_plane).to receive(:request_to_land).with(airport)
      flying_plane.request_to_land(airport)
    end

    it 'a plane can take off' do
      allow(airport).to receive(:weather_status) {"sunny"}
      airport.planes << landed_plane
      expect(landed_plane).to receive(:request_to_takeoff).with(airport)
      landed_plane.request_to_takeoff(airport)
    end
  end

  context 'traffic control' do
    it 'airport knows when it is full' do
      allow(airport).to receive(:weather_status) {"sunny"}
      fill_airport
      expect(airport).to be_full
    end

    it 'a plane cannot land if the airport is full' do
      allow(airport).to receive(:weather_status) {"sunny"}
      fill_airport
      expect{airport.permission_to_land(flying_plane)}.to raise_error(RuntimeError, 'Airport is full')
    end
  end

  context 'in stormy weather' do
    it 'a plane cannot take off' do
      allow(airport).to receive(:weather_status) {"stormy"}
      expect(airport.weather_status).to eq('stormy')
      expect{airport.permission_to_takeoff(landed_plane)}.to raise_error(RuntimeError, 'Storm brewing, cannot take off right now')
    end

    it 'a plane cannot land' do
      allow(airport).to receive(:weather_status) {"stormy"}
      expect(airport.plane_count).to be(0)
      expect(airport.weather_status).to eq('stormy')
      expect{airport.permission_to_land(flying_plane)}.to raise_error(RuntimeError, 'Storm brewing, cannot land right now')
    end
  end

end
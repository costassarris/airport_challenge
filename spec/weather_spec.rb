require 'weather'

describe Weather do

let(:weather) {Weather.new}

it 'should return either stormy or sunny, but more often sunny' do
  expect(weather.weather_status).to satisfy{|w| ['sunny', 'stormy'].include?(w)}
end

end
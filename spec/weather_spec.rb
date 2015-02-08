require 'weather'

class RandomWeather; include Weather; end

describe Weather do

let(:weather) {RandomWeather.new}

it 'should return either stormy or sunny, but more often sunny' do
  expect(weather.weather_status).to satisfy{|w| ['sunny', 'stormy'].include?(w)}
end

end
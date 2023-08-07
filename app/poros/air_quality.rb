class AirQuality
  attr_reader :aqi, :co_concentration, :pm25_concentration, :city 

  def initialize(data, city)
    @aqi = data[:overall_aqi]
    @co_concentration = data[:CO][:concentration]
    @pm25_concentration = data[:"PM2.5"][:concentration]
    @city = city 
  end
end
class AirQualityFacade
  def self.get_quality(city)
    data = AirQualityService.city_search(city)
      AirQuality.new(data, city)
  end
end
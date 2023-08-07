class AirQualitySerializer 
  include JSONAPI::Serializer
  set_id {nil}
  set_type :air_quality
  attributes :city, :aqi, :pm25_concentration, :co_concentration
end
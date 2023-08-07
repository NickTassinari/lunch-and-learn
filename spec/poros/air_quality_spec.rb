require "rails_helper"

RSpec.describe AirQuality do 
  describe "initialize" do 
    it "exists and has readable attributes" do 
      data ={overall_aqi: 102,
      :"PM2.5" => { concentration: 2.95, aqi: 8 },
      :CO => { concentration: 216.96, aqi: 2 }
      }
      city = "Paris"
      air_quality = AirQuality.new(data, city)
      expect(air_quality).to be_an(AirQuality)
      expect(air_quality.aqi).to eq(102)
      expect(air_quality.pm25_concentration).to eq(2.95)
      expect(air_quality.co_concentration).to eq(216.96)
      expect(air_quality.city).to eq("Paris")
    
    end
  end
end
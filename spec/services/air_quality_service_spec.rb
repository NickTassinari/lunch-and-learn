require "rails_helper"

RSpec.describe AirQualityService do 
  describe "class_methods" do 
    describe ".city_search" do 
      it "returns JSON object from API", :vcr do 
        response = AirQualityService.city_search("Paris")
        expect(response).to be_a(Hash)
        expect(response).to have_key(:CO)
        expect(response[:CO]).to be_a(Hash)
        expect(response[:CO]).to have_key(:concentration)
        expect(response[:CO][:concentration]).to be_a(Float)
        expect(response).to have_key(:"PM2.5")
        expect(response[:"PM2.5"]).to be_a(Hash)
        expect(response[:"PM2.5"]).to have_key(:concentration)
        expect(response[:"PM2.5"][:concentration]).to be_a(Float)
        expect(response).to have_key(:overall_aqi)
        expect(response[:overall_aqi]).to be_an(Integer)
      end
    end
  end
end
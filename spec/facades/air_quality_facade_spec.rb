require 'rails_helper'

RSpec.describe AirQualityFacade do 
  describe "class_methods" do 
    describe ".get_quality" do 
      it "returns ", :vcr do 
        expect(AirQualityFacade.get_quality("Paris")).to be_an(AirQuality)
      end
    end
  end
end
require "rails_helper"

RSpec.describe CountryFacade do 
  describe 'class_methods' do
    describe ".random_country" do 
      it "returns a String of the common name of randomly selected country", :vcr do 
        expect(CountryFacade.random_country).to be_a(String)
      end

      
    end
    
  end
end
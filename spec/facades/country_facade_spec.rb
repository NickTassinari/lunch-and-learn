require "rails_helper"

RSpec.describe CountryFacade do 
  describe 'class_methods' do
    describe ".random_country" do 
      it "returns a String of the common name of randomly selected country", :vcr do 
        expect(CountryFacade.random_country).to be_a(String)
      end
    end
    
    describe ".is_a_country" do 
      it "returns a string with valid params", :vcr do
        expect(CountryFacade.is_a_country("ital")).to be_a(String)
        expect(CountryFacade.is_a_country("ital")).to eq("Italy")
      end

      it "returns nil with invalid params", :vcr do 
        expect(CountryFacade.is_a_country("Nicklan")).to be_a(NilClass)
        expect(CountryFacade.is_a_country("")).to be_a(NilClass)
      end
    end

    describe ".results" do 
      it "returns array of countries matching param", :vcr do 
        expect(CountryFacade.results("ital")).to be_a(Hash)
        expect(CountryFacade.results("ital")).to have_key(:name)
        expect(CountryFacade.results("ital")[:name]).to be_a(Hash)
        expect(CountryFacade.results("ital")[:name]).to have_key(:common)
        expect(CountryFacade.results("ital")[:name][:common]).to be_a(String)
        expect(CountryFacade.results("ital")[:name][:common]).to eq("Italy")
      end
    end
  end
end
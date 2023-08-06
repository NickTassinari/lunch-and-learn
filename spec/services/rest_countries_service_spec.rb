require "rails_helper"

RSpec.describe RestCountriesService do 
  describe "class_methods" do 
    describe ".search" do 
      it "returns JSON object from API", :vcr do 
        response = RestCountriesService.search('peru')
        expect(response).to be_an(Array)
        expect(response.first).to be_a(Hash)

        first_result = response.first 
        expect(first_result).to have_key(:name)
        expect(first_result[:name]).to be_a(Hash)
        expect(first_result[:name]).to have_key(:common)
        expect(first_result[:name][:common]).to be_a(String)
      end
    end

    describe ".all_countries" do 
      it "returns a JSON object from API", :vcr do 
        response = RestCountriesService.all_countries
        expect(response).to be_an(Array)
        expect(response.first).to be_a(Hash)

        first_result = response.first
        expect(first_result).to have_key(:name)
        expect(first_result[:name]).to be_a(Hash)

        expect(first_result[:name]).to have_key(:common)
        expect(first_result[:name][:common]).to be_a(String)
      end
    end

    describe ".get_url", :vcr do 
      it "returns JSON hash from response body" do 
        url = RestCountriesService.get_url("/v3.1/all")
        expect(url).to be_an(Array)
      end
    end

    describe '.conn', :vcr do
      it "connects with restcountries.com" do 
        conn = RestCountriesService.conn 
        expect(conn.params).to be_a(Hash)
      end
    end
  end
end
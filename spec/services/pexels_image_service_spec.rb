require "rails_helper"

RSpec.describe PexelsImageService do
  describe "class_methods" do 
    describe '.search_by_country' do
      it "returns JSON object from API", :vcr do 
        response = PexelsImageService.search_by_country("Peru")
        expect(response).to be_a(Hash)
        expect(response).to have_key(:photos)
        expect(response[:photos]).to be_an(Array)

        first_result = response[:photos].first
        expect(first_result).to be_a(Hash)
        expect(first_result).to have_key(:alt)
        expect(first_result[:alt]).to be_a(String)
        expect(first_result).to have_key(:url)
        expect(first_result[:url]).to be_a(String)
      end
    end

    describe ".get_url", :vcr do 
      it "returns JSON hash from response body" do 
        url = PexelsImageService.get_url("/v1/search?query=Peru")
        expect(url).to be_a(Hash)
      end
    end

    describe ".conn", :vcr do 
      it "connects with api" do 
        conn = PexelsImageService.conn 
        expect(conn.params).to be_a(Hash)
      end
    end
  end  
end
require "rails_helper"

RSpec.describe EdamamRecipeService do 
  describe "class_methods" do 
    describe ".search_by_country" do 
      it "returns JSON object from API", :vcr do 
        response = EdamamRecipeService.search_by_country("Peru")
        expect(response).to be_a(Hash)
        expect(response).to have_key(:hits)
        expect(response[:hits]).to be_an(Array)
        
        first_result = response[:hits].first
        expect(first_result).to be_a(Hash)
        expect(first_result).to have_key(:recipe)
        expect(first_result[:recipe]).to be_a(Hash)
        
        expect(first_result[:recipe]).to have_key(:label)
        expect(first_result[:recipe][:label]).to be_a(String)
        expect(first_result[:recipe]).to have_key(:uri)
        expect(first_result[:recipe][:uri]).to be_a(String)
        expect(first_result[:recipe]).to have_key(:image)
        expect(first_result[:recipe][:image]).to be_a(String)
      end
    end

    describe ".get_url", :vcr do 
      it "returns JSON hash from response body" do 
        url = EdamamRecipeService.get_url('/api/recipes/v2?type=public&q=Peru')
        expect(url).to be_a(Hash)
      end
    end

    describe ".conn", :vcr do 
      it "connects with api.edamam.com" do 
        conn = EdamamRecipeService.conn 
        expect(conn.params).to be_a(Hash)
      end
    end
  end
end
require "rails_helper" 

RSpec.describe YouTubeService do 
  describe "class_methods" do 
    describe ".search_by_country" do 
      it "returns JSON object from API", :vcr do 
        response = YouTubeService.search_by_country("Japan")
        expect(response).to be_a(Hash)
        expect(response).to have_key(:items)
        expect(response[:items]).to be_an(Array)

        first_result = response[:items].first 
        expect(first_result).to be_a(Hash)
        expect(first_result).to have_key(:id)
        expect(first_result[:id]).to be_a(Hash)
        expect(first_result[:id]).to have_key(:videoId)
        expect(first_result[:id][:videoId]).to be_a(String)
        expect(first_result).to have_key(:snippet)
        expect(first_result[:snippet]).to be_a(Hash)
        expect(first_result[:snippet]).to have_key(:title)
        expect(first_result[:snippet][:title]).to be_a(String)
      end
    end

    describe '.get_url', :vcr do
      it "returns JSON hash from response body" do 
        url = YouTubeService.get_url("/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=japan&type=video")
        expect(url).to be_a(Hash)
      end
    end

    describe ".conn", :vcr do 
      it "connects with youtube api" do 
        conn = YouTubeService.conn 
        expect(conn.params).to be_a(Hash)
      end
    end
  end
end
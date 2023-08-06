require "rails_helper"

RSpec.describe VideosFacade do 
  describe ".get_videos" do 
    it "returns an array of video objects", :vcr do 
      expect(VideosFacade.get_videos("Peru")).to be_an(Array)
      expect(VideosFacade.get_videos("Peru").first).to be_a(Video)
    end

    it "returns an empty array with invalid params", :vcr do
      expect(VideosFacade.get_videos("cbvjfjgk")).to eq([])
    end 
  end

  describe ".results" do 
    it "returns array of videos matching param", :vcr do 
      expect(VideosFacade.results("Peru")).to be_an(Array)

      first_result = VideosFacade.results("Peru").first 
      expect(first_result).to be_a(Hash)
      expect(first_result).to have_key(:id)
      expect(first_result[:id]).to be_a(Hash)
      expect(first_result).to have_key(:snippet)
      expect(first_result[:snippet]).to have_key(:title)
      expect(first_result[:snippet][:title]).to be_a(String)
    end
  end
end
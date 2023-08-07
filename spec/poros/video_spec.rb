require "rails_helper"

RSpec.describe Video do
  describe "initialize" do 
    it "exists and has readable attributes" do 
      attrs = { snippet: { title: "title"}, id: { videoId: "videoId"}}
      video = Video.new(attrs)

      expect(video.title).to eq("title")
      expect(video.youtube_video_id).to eq("videoId")
    end
  end
end
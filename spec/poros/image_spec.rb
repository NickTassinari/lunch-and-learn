require "rails_helper"

RSpec.describe Image do
  describe "initialize" do 
    it "exists and has readable attributes" do 
      attrs = { alt: "alt", src: { original: "original"} }
      image = Image.new(attrs)

      expect(image).to be_an(Image)
      expect(image.alt_tag).to eq("alt")
      expect(image.url).to eq("original")
    end
  end
end
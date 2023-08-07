require "rails_helper"

RSpec.describe ImagesFacade do 
  describe "class_methods" do 
    describe ".get_images" do 
      it "returns array of image objects", :vcr do 
        expect(ImagesFacade.get_images("Peru")).to be_an(Array)
        expect(ImagesFacade.get_images("Peru").first).to be_an(Image)        
      end

      it "returns an empty array with invalid params", :vcr do 
        expect(ImagesFacade.get_images("adfjlk")).to eq([])
        expect(ImagesFacade.get_images("")).to eq([])
      end
    end
  end
end
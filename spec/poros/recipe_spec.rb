require 'rails_helper'

RSpec.describe Recipe do
  before(:each) do 
    attrs = { label: "Arriba Peru", uri: "uri", image: "image.jpg"}
    country = "Peru" 

    @recipe = Recipe.new(attrs, country)
  end

  describe "initialize" do 
    it "exists and has readable attributes" do 

      expect(@recipe).to be_a(Recipe)
      expect(@recipe.title).to eq("Arriba Peru")
      expect(@recipe.url).to eq("uri")
      expect(@recipe.image).to eq("image.jpg")
      expect(@recipe.country).to eq("Peru")
    end
  end
  
end
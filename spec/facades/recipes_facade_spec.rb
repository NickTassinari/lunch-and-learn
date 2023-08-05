require 'rails_helper'

RSpec.describe RecipesFacade do 
  describe "class_methods" do 
    describe ".get_recipes" do 
      it "returns an array of recipe objects", :vcr do 
        expect(RecipesFacade.get_recipes("Peru")).to be_an(Array)
        expect(RecipesFacade.get_recipes("Peru").first).to be_a(Recipe)
      end

      it "returns an empty array with invalid params", :vcr do 
        expect(RecipesFacade.get_recipes("nicks very own country")).to eq([])
        expect(RecipesFacade.get_recipes("")).to eq([])
      end
    end

    describe ".results" do 
      it "returns array of recipes from specified contry", :vcr do 
        expect(RecipesFacade.results("Peru")).to be_an(Array)

        first_result = RecipesFacade.results("Peru").first

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
  end
end
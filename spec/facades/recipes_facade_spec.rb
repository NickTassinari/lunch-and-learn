require 'rails_helper'

RSpec.describe RecipesFacade do 
  describe "class_methods" do 
    describe ".get_recipes" do 
      it "returns an array of recipe objects", :vcr do 
        expect(RecipesFacade.get_recipes("Peru")).to be_an(Array)
        expect(RecipesFacade.get_recipes("Peru").first).to be_a(Recipe)
      end
    end
  end
end
require "rails_helper"

RSpec.describe "Index Recipes API" do 
  it "can get list of recipes by country", :vcr do 
    get "/api/v1/recipes?country=peru"

    expect(response).to be_successful 

    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(recipes[:data].count).to eq(20)
    expect(recipes.size).to eq(1)

    recipes[:data].each do |recipe|
      expect(recipe.size).to eq(3)
      expect(recipe).to have_key(:id)
      expect(recipe[:id]).to be_a(NilClass)

      expect(recipe).to have_key(:type)
      expect(recipe[:type]).to be_a(String)
      expect(recipe[:type]).to eq("recipe")

      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes]).to be_a(Hash)

      expect(recipe[:attributes].size).to eq(4)
      expect(recipe[:attributes]).to have_key(:title)
      expect(recipe[:attributes][:title]).to be_a(String)
      expect(recipe[:attributes]).to have_key(:url)
      expect(recipe[:attributes][:url]).to be_a(String)
      expect(recipe[:attributes]).to have_key(:country)
      expect(recipe[:attributes][:country]).to be_a(String)
      expect(recipe[:attributes]).to have_key(:image)
      expect(recipe[:attributes][:image]).to be_a(String)
    end
  end

  it "returns a 404 error with invalid params", :vcr do 
    get "/api/v1/recipes?country=asdfjl"

    expect(response).to_not be_successful

    error = JSON.parse(response.body, symbolize_names: true)
    expect(error.size).to eq(1)
    expect(error).to have_key(:message)
    expect(error[:message]).to be_a(String)

    expect(response.status).to eq(404)
  end

  xit "returns a random country with no params", :vcr do 
    get "/api/v1/recipes"

    expect(response).to be_successful 
    recipes = JSON.parse(response.body, symbolize_names: true)

    recipes[:data].each do |recipe|
      expect(recipe).to have_key(:id)
      expect(recipe[:id]).to be_a(NilClass)
      expect(recipe).to have_key(:type)
      expect(recipe[:type]).to be_a(String)
      expect(recipe[:type]).to eq("recipe")
      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes]).to be_a(Hash)
      expect(recipe[:attributes]).to have_key(:title)
      expect(recipe[:attributes][:title]).to be_a(String)
      expect(recipe[:attributes]).to have_key(:url)
      expect(recipe[:attributes][:url]).to be_a(String)
      expect(recipe[:attributes]).to have_key(:country)
      expect(recipe[:attributes][:country]).to be_a(String)
      expect(recipe[:attributes]).to have_key(:image)
      expect(recipe[:attributes][:image]).to be_a(String)
    end
  end
end
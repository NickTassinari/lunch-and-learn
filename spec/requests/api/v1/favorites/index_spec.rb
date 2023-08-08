require "rails_helper"

RSpec.describe "Index Favorites API" do 
  before(:each) do 
    user = create(:user, api_key: "key")
    4.times { create(:favorite) }
    favorites = Favorite.all
    favorites.each do |favorite|
      create(:users_favorite, user: user, favorite: favorite)
    end
  end

  it "can get a list of favorites and return JSON response" do 
    get "/api/v1/favorites?api_key=key"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    index = JSON.parse(response.body, symbolize_names: true)

    expect(index.size).to eq(1)
    expect(index).to have_key(:data)
    expect(index[:data]).to be_an(Array)

    index[:data].each do |data|
      expect(data.size).to eq(3)
      expect(data).to have_key(:id)
      expect(data[:id]).to be_a(String)
      expect(data).to have_key(:type)
      expect(data[:type]).to be_a(String)
      expect(data[:type]).to eq("favorite")
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)
      expect(data[:attributes].size).to eq(4)
      expect(data[:attributes]).to have_key(:recipe_title)
      expect(data[:attributes][:recipe_title]).to be_a(String)
      expect(data[:attributes]).to have_key(:recipe_link)
      expect(data[:attributes][:recipe_link]).to be_a(String)
      expect(data[:attributes]).to have_key(:country)
      expect(data[:attributes][:country]).to be_a(String)
      expect(data[:attributes]).to have_key(:created_at)
      expect(data[:attributes][:created_at]).to be_a(String)
    end
  end
end
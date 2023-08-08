require "rails_helper"

RSpec.describe "Destroy Favorites API" do 
  before(:each) do 
    @user = User.create!(name: "Nick", email: "afsdk@gmail.com", password: "word", password_confirmation: "word", api_key: "key")
    @favorite = Favorite.create!(country: "country", recipe_link: "linkage", recipe_title: "how to boil your own toes")
    @user_fave = UsersFavorite.create!(user: @user, favorite: @favorite)
  end

  it "can delete a favorite and return JSON response" do 
    favorite_params = ({
      api_key: "key",
      country: @favorite.country,
      recipe_link: @favorite.recipe_link,
      recipe_title: @favorite.recipe_title
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      delete "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      destroyer = JSON.parse(response.body, symbolize_names: true)

      expect(destroyer[:success]).to eq("Favorite removed successfully")

      
  end
end
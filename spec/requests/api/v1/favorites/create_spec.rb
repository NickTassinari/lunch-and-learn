require "rails_helper"

RSpec.describe "Create Favorites API" do 
  before(:each) do 
    @user = User.create!(name: "Nick", email: "afsdk@gmail.com", password: "word", password_confirmation: "word", api_key: "key")
  end

  it "can post new user_favorite and return JSON response with valid params and no existing favorite" do 
    favorite_params = ({
      api_key: "key",
      country: "country",
      recipe_link: "linkage",
      recipe_title: "boiled pork butt"
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    created_favorite = JSON.parse(response.body, symbolize_names: true)

    expect(created_favorite.size).to eq(1)
    expect(created_favorite).to have_key(:success)
    expect(created_favorite[:success]).to eq("Favorite successfully added")
  end

  it "can post a new user_favorite with valid params and existing favorite" do 
    favorite = Favorite.create!(country: "country", recipe_link: "linkage", recipe_title: "how to boil your own toes")
    favorite_params = ({
      api_key: "key",
      country: "country",
      recipe_link: "linkage",
      recipe_title: "how to boil your own toes"
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    created_favorite = JSON.parse(response.body, symbolize_names: true)

    expect(created_favorite.size).to eq(1)
    expect(created_favorite).to have_key(:success)
    expect(created_favorite[:success]).to eq("Favorite successfully added")
  end

  it "returns 401 error with invalid params" do 
    favorite_params = ({
      api_key: 'not a key',
      country: 'country',
      recipe_link: 'linkovich',
      recipe_title: 'pineapple right side up cake'
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

    expect(response).not_to be_successful

    error = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)

    expect(error).to have_key(:message)
    expect(error[:message]).to be_a(String)
    expect(error[:message]).to eq("Invalid api_key")
  end

  it "returns 400 error with missing params" do 
    favorite_params = ({
      api_key: 'key',
      recipe_link: 'linkage',
      recipe_title: 'idk anything'
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

    expect(response).not_to be_successful

    error = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)

    expect(error).to have_key(:message)
    expect(error[:message]).to be_a(String)
    expect(error[:message]).to eq("Country can't be blank")
  end
end
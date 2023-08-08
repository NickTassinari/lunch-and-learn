require "rails_helper"

describe "Create User Api" do 
  it "can post a new user and return JSON response" do 
    user_params = ({
      name: "Nick",
      email: "thisismyemail@gmail.com",
      password: "idiotsluggage",
      password_confirmation: "idiotsluggage"
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful

    created_user = JSON.parse(response.body, symbolize_names: true)

    expect(created_user.size).to eq(1)
    data = created_user[:data]

    expect(data.size).to eq(3)
    expect(data).to have_key(:id)
    expect(data[:id]).to be_a(String)

    expect(data).to have_key(:type)
    expect(data[:type]).to be_a(String)
    expect(data[:type]).to eq("user")

    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes].size).to eq(3)

    expect(data[:attributes]).to have_key(:name)
    expect(data[:attributes][:name]).to be_a(String)
    expect(data[:attributes][:name]).to eq("Nick")

    expect(data[:attributes]).to have_key(:email)
    expect(data[:attributes][:email]).to be_a(String)
    expect(data[:attributes][:email]).to eq("thisismyemail@gmail.com")

    expect(data[:attributes]).to have_key(:api_key)
    expect(data[:attributes][:api_key]).to be_a(String)
  end

  it "will return 400 error with invalid params" do 
    User.create(name: "Nick", email: "myemail@gmail.com", password: "word", password_confirmation: "word")
    user_params = ({
      name: "notNick",
      email: "myemail@gmail.com",
      password: "word",
      password: "word"
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    expect(response).to_not be_successful

    error = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(error[:message]).to be_a(String)
    expect(error[:message]).to eq("Email has already been taken")
  end

  it "will return 400 error with missing params" do 
    user_params = ({
      name: "Nick",
      password: "word",
      password_confirmation: "word"
    })
    headers = { "CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    expect(response).to_not be_successful

    error = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)

    expect(error[:message]).to be_a(String)
    expect(error[:message]).to eq("Email can't be blank")
  end
end
require "rails_helper"

RSpec.describe "Index Learning resources API" do 
  it "can get a single video and lsit of images by country", :vcr do 
    get "/api/v1/learning_resources?country=peru"

    expect(response).to be_successful

    resources = JSON.parse(response.body, symbolize_names: true)

    expect(resources.size).to eq(1)
    data = resources[:data]

    expect(data.size).to eq(3)
    expect(data).to have_key(:id)
    expect(data[:id]).to be_a(NilClass)

    expect(data).to have_key(:type)
    expect(data[:type]).to be_a(String)
    expect(data[:type]).to eq("learning_resource")

    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes].size).to eq(3)

    expect(data[:attributes]).to have_key(:country)
    expect(data[:attributes][:country]).to be_a(String)
    expect(data[:attributes]).to have_key(:video)
    expect(data[:attributes][:video]).to be_a(Hash)
    expect(data[:attributes][:video].size).to eq(2)
    expect(data[:attributes][:video]).to have_key(:title)
    expect(data[:attributes][:video][:title]).to be_a(String)
    expect(data[:attributes][:video]).to have_key(:youtube_video_id)
    expect(data[:attributes][:video][:youtube_video_id]).to be_a(String)
    expect(data[:attributes]).to have_key(:images)
    expect(data[:attributes][:images]).to be_an(Array)
    expect(data[:attributes][:images].first).to be_a(Hash)
    expect(data[:attributes][:images].first.size).to eq(2)
    expect(data[:attributes][:images].first).to have_key(:alt_tag)
    expect(data[:attributes][:images].first[:alt_tag]).to be_a(String)
    expect(data[:attributes][:images].first).to have_key(:url)
    expect(data[:attributes][:images].first[:url]).to be_a(String)

  end
end
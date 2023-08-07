require "rails_helper"

describe "Index air quality API" do 
  it "can get air quality info by capital city", :vcr do 
    get "/api/v1/air_quality?country=Nigeria"

    expect(response).to be_successful 

    air_quality = JSON.parse(response.body, symbolize_names: true)
    expect(air_quality).to have_key(:data)
    expect(air_quality[:data].count).to eq(3)
    expect(air_quality[:data]).to have_key(:id)
    expect(air_quality[:data][:id]).to be_a(NilClass)
    expect(air_quality[:data]).to have_key(:type)
    expect(air_quality[:data][:type]).to eq("air_quality")
    expect(air_quality[:data]).to have_key(:attributes)
    expect(air_quality[:data][:attributes]).to be_a(Hash)
    expect(air_quality[:data][:attributes]).to have_key(:city)
    expect(air_quality[:data][:attributes][:city]).to be_a(String)
    expect(air_quality[:data][:attributes]).to have_key(:aqi)
    expect(air_quality[:data][:attributes][:aqi]).to be_a(Integer)
    expect(air_quality[:data][:attributes]).to have_key(:pm25_concentration)
    expect(air_quality[:data][:attributes][:pm25_concentration]).to be_a(Float)
    expect(air_quality[:data][:attributes]).to have_key(:co_concentration)
    expect(air_quality[:data][:attributes][:co_concentration]).to be_a(Float)
    expected_json = {:data=>
                      {
                      :id=>nil,
                      :type=>"air_quality",
                      :attributes=>
                        {
                        :city=>"Abuja", 
                        :aqi=>25, 
                        :pm25_concentration=>4.21, 
                        :co_concentration=>433.92
                        }
                      }
                    }
    expect(air_quality).to eq(expected_json)
  end
end
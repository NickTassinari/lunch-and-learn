require "rails_helper"

RSpec.describe Country do
  describe "initialize" do 
    it "exists and has readable attributes" do 
      attrs = "Peoples Republic of China"
      country = Country.new(attrs)

      expect(country).to be_a(Country)

      expect(country.country).to eq("Peoples Republic of China")
    end
  end
  
end
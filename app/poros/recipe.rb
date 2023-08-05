class Recipe 
  attr_reader :title, :url, :country, :image
  def initialize(data, country)
    @title = data[:label]
    @url = data[:uri]
    @country = country 
    @image = data[:image]
  end
end
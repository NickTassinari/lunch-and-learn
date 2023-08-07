class RestCountriesService
  
  def self.search(country)
    get_url("/v3.1/name/#{country}")
  end

  def self.all_countries
    get_url("/v3.1/all")
  end
#this should really go in the facade
  def self.get_capital(country)
    get_url("/v3.1/name/#{country}")[:capital]
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
  
  def self.conn 
    Faraday.new(url: "https://restcountries.com")
  end
end
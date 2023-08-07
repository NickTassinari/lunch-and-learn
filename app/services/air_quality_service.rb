class AirQualityService 

  def self.city_search(city) 
    get_url("/v1/airquality?city=#{city}")
  end

  
  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
  
  def self.conn 
    Faraday.new(url: "https://api.api-ninjas.com") do |f|
      f.headers['X-Api-Key'] = ENV["ninja_key"]
    end

  end
  
end

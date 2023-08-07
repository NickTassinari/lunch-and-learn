class PexelsImageService 
  def self.search_by_country(country)
    get_url("/v1/search?query=#{country}")
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.conn 
    Faraday.new(url: 'https://api.pexels.com') do |f|
      f.headers["Authorization"] = ENV["pexels_token"]
    end
  end
end
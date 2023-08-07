class ImagesFacade 
  def self.get_images(country)
    result = PexelsImageService.search_by_country(country)[:photos]

    if result 
      result.map do |data|
        Image.new(data)
      end
    else   
        return []
    end
  end
end
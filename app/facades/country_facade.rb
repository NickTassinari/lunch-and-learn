class CountryFacade 
  def self.random_country
    RestCountriesService.all_countries.sample[:name][:common]
  end

  def self.is_a_country(country)
    if results(country)
      results(country)[:name][:common]
    else   
      return nil
    end
  end

  def self.get_capital(country)
    results(country)[:capital][0]
  end

  def self.results(country)
    RestCountriesService.search(country)[0]
  end
end
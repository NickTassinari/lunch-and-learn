module Api 
  module V1 
    class AirQualityController < ApplicationController
      def index 
        country = params[:country]
        
        capital = CountryFacade.get_capital(country)
        
        air_quality = AirQualityFacade.get_quality(capital)
        
        render json: AirQualitySerializer.new(air_quality)
      end
    end
  end
end
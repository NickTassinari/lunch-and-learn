class CountriesController < ApplicationController 
  def show 
    require 'pry'; binding.pry
    country = params[:]
  end
end
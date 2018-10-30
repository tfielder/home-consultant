class SearchController < ApplicationController
  def new

  end

  def create
    address = AddressFormatter.new(params[:address]).formatter

    require "pry"; binding.pry
    api_call = PropertyService.new(address, auth_token)


  end
end

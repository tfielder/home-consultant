class SearchController < ApplicationController
  def new

  end

  def create
    address = AddressFormatter.new(params[:address]).formatter

    api_call = PropertyService.new(address, auth_token)

    pf = PropertyFacade.new(api_call.response)
    require "pry"; binding.pry


  end
end

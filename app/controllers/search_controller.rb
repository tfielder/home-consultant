class SearchController < ApplicationController
  def new

  end

  def create
    address = AddressFormatter.new(params[:address]).formatter
    api_call = PropertyService.new(address, auth_token)
    @property_facade = PropertyFacade.new(api_call.response)


    render "main_page/index"
  end
end

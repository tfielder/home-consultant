class MainPageController < ApplicationController

  def search

  end

  def create
    address = AddressFormatter.new(params[:address]).formatter
    api_call = PropertyService.new(address, auth_token)
    @property_facade = PropertyFacade.new(api_call.response)
    render :prepare
  end

  def prepare
    @property_facade
  end
end

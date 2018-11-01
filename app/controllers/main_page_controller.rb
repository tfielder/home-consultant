class MainPageController < ApplicationController

  def search

  end

  def create
    if params[:address]
      address = AddressFormatter.new(params[:address]).formatter
      api_call = PropertyService.new(address, auth_token)
      @property_facade = PropertyFacade.new(api_call.response)
    else
      flash.now[:error] = ""
    end
    render :prepare
  end
end

class MainPageController < ApplicationController

  def search
  end

  def create
    if params[:address] && ! params[:address].include?('_')
      address = AddressFormatter.new(params[:address]).formatter
      api_call = PropertyService.new(address, auth_token)
      @property_facade = PropertyFacade.new(api_call.response)
      render :prepare
    else
      flash.now[:error] = "That address does not exist/is incomplete. Please try again."
      render :index
    end
  end
end

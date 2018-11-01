class MainPageController < ApplicationController

  def search

  end

  def create
    if params[:address]
      address = AddressFormatter.new(params[:address]).formatter
      api_call = PropertyService.new(address, auth_token)
      @property_facade = PropertyFacade.new(api_call.response)
    end
    if params[:about]
      binding.pry
      AppointmentCollector.new(params[:about],
                  params[:recommended_price],
                  params[:opciones],
                  params[:commission],
                  params[:about_seller],
                  params[:cc_number],
                  params[:cc_expiration_month][:cc_expires_year]
                  )
    end
    render :prepare
  end
end

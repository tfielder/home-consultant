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
      appointment_info = {}
      appointment_info[:consultation] = {
        :address => params[:address],
        :about_this_home => params[:about_this_home],
        :client_enthusiasm => params[:client_enthusiasm],
        :commission => params[:commission],
        :about_the_seller => params[:about_the_seller],
        :credit_card => params[:credit_card],
        :exp_date => params[:exp_date],
        :price => params[:price]
      }
      binding.pry
      AppointmentCollector.new(appointment_info, auth_token, email)
      #need email as a helper
    end
    render :prepare
  end
end

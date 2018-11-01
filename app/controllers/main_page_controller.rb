class MainPageController < ApplicationController

  def search

  end

  def create
    if params[:address]
      session[:address] = AddressFormatter.new(params[:address]).formatter
      api_call = PropertyService.new(address, auth_token)
      session[:property_facade] = PropertyFacade.new(api_call.response)
      @property_facade = property_facade
      render :prepare
    end
    if params[:about_this_home]
      appointment_info = {}
      appointment_info[:consultation] = {
        :address => address,
        :about_this_home => params[:about_this_home],
        :client_enthusiasm => params[:client_enthusiasm],
        :commission => params[:commission],
        :about_the_seller => params[:about_the_seller],
        :credit_card => params[:credit_card],
        :exp_date => params[:exp_date][:exp_date_2],
        :price => params[:price]
      }
      AppointmentCollector.new(appointment_info, auth_token, email)
      attributes = JSON.parse(property_facade.to_json, symbolize_names: true)
      @property_facade = PropertyFacade.new(attributes[:attributes])
      render :prepare
    end
  end
end

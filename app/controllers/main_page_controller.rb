class MainPageController < ApplicationController

  def index
  end

  def create
    if params[:address] && ! params[:address].include?('_')
      address = AddressFormatter.new(params[:address]).formatter
      api_call = PropertyService.new(address, auth_token)
      facade_raw_data = api_call.response
      facade_raw_data = JSON.parse(facade_raw_data.to_json, symbolize_names: true)
      @property_facade = PropertyFacade.new(facade_raw_data)
      render :prepare
    elsif params[:credit_card]
      binding.pry
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
      AppointmentCollector.new(appointment_info, auth_token, params[:email])
      facade_raw_data = eval(params["attributes"])
      @property_facade = PropertyFacade.new(facade_raw_data)
      render :prepare
    else
      flash.now[:error] = "That address does not exist/is incomplete. Please try again."
      render :index
    end
  end
end

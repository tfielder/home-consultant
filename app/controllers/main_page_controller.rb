class MainPageController < ApplicationController
  before_action :check_login

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
      appointment_info = {consultation: {
        :address => address,
        :about_this_home => params[:about_this_home],
        :client_enthusiasm => params[:client_enthusiasm],
        :commission => params[:commission],
        :about_the_seller => params[:about_the_seller],
        :credit_card => params[:credit_card],
        :exp_date => params[:exp_date][:exp_date_2],
        :price => params[:price],
        :start_time => params[:start_time],
        :end_time => params[:end_time]
      }}
      AppointmentCollector.new(appointment_info, auth_token, params[:email])
      facade_raw_data = eval(params["attributes"])
      @property_facade = PropertyFacade.new(facade_raw_data)
      render :prepare
    else
      flash.now[:error] = "That address does not exist/is incomplete. Please try again."
      render :index
    end
  end
  private

  def check_login
    redirect_to '/' unless session[:user]
  end
end

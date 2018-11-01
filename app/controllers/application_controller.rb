class ApplicationController < ActionController::Base
  helper_method :auth_token, :address, :property_facade

  def auth_token
    session[:user]
  end

  def email
    session[:email]
  end

  def property_facade
    atts = JSON.parse(session[:property_facade].to_json, symbolize_names: true)
    PropertyFacade.new(atts[:attributes])
  end

  def address
    session[:address]
  end

end

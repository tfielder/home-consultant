class ApplicationController < ActionController::Base
  helper_method :auth_token, :address, :property_facade

  def auth_token
    session[:user]
  end

  def email
    session[:email]
  end

  def property_facade
    session[:property_facade]
  end

  def address
    session[:address]
  end

end

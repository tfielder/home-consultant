class ApplicationController < ActionController::Base
  helper_method :auth_token, :address, :property_facade

  def auth_token
    session[:user]
  end

  def address
    session[:address]
  end
end

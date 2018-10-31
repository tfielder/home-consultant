class ApplicationController < ActionController::Base
  helper_method :auth_token

  def auth_token
    session[:user]
  end

end

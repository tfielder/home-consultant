class SessionController < ApplicationController
  def new
  end

  def create
    result = MembersService.new(params[:user][:address], params[:password])
    if result.success
      session[:user] = result.success
      redirect_to '/main_page'
    else
      flash.now[:error] = result.error
      render :new
    end
  end
end

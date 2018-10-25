class SessionController < ApplicationController
  def new
  end

  def create
    result = MembersService.new(params[:user][:address], params[:password])
    if result.success
      @current_user = result.success

      redirect_to "/search/new"
    else
      flash[:notice] = "Invalid email/password. Please try again."
      render :new
    end
  end
end

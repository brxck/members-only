class SessionsController < ApplicationController
  def new
    redirect_to root_url if logged_in?
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      if params[:session][:remember_me] == "1"
        remember @user
      else
        forget
      end
      log_in @user
      redirect_to root_path
    else
      flash.now[:danger] = 'access denied'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end

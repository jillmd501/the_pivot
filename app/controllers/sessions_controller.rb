class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
      if valid_login?
        session[:user_id] = @user.id
        redirect_to dashboard_path
      else
        flash.now[:error] = "Invalid"
        render :new
      end
  end

  def destroy
    session.clear
    flash[:notice] = "Goodbye!"
    redirect_to login_path
  end
end

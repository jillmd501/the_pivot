class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:error] = "Invalid Login"
      redirect_to new_user_path
    end
  end

  def show
    if current_admin?
      redirect_to admin_dashboard_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

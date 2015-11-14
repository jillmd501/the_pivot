class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user)
      redirect_to root_url, :notice => "Signed up"
    else
      render :new
    end
  end

  def show
    @user = current_user
    unless @user
      redirect_to root_path
      flash[:error] = "You are not permitted to view that user."
      return
    end
  end
end

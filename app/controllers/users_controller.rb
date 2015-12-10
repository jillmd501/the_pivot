class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      create_user
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:error] = "Invalid Login"
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user && current_user.id == @user.id
      if current_user.update_attributes(update_user_params)
        flash[:notice] = "User Updated!"
        redirect_to dashboard_path
      else
        flash[:error] = @user.errors.full_messages.join(", ") + "ʕ ಡ ﹏ ಡ ʔ"
        redirect_to :back
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
                  :username,
                  :email,
                  :password,
                  :first_name,
                  :last_name,
                  :avatar
                  )
  end

  def update_user_params
    params.require(:user).permit(
                                 :email,
                                 :first_name,
                                 :last_name,
                                 :password
                                 )
  end

  def create_user
    role = Role.find_by(name: "registered_user")
    @user.roles << role
  end
end

class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.set_address(user_address_params)
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:error] = "Invalid Login"
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
    # if current_admin?
    #   redirect_to admin_dashboard_path
    # end
  end

  def edit
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if current_user && current_user.id == @user.id
      if current_user.update_attributes(update_user_params)
        flash[:notice] = "User Updated!"
        redirect_to dashboard_path
      else
        flash[:errors] = @user.errors.full_messages.join(", ")
        redirect_to :back
      end
    end 
  end

  private

  def user_params
    params.permit(
                  :username,
                  :email,
                  :password,
                  :first_name,
                  :last_name
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

  def user_address_params
    params.permit(
                   :address_line_1,
                   :address_line_2,
                   :city,
                   :state,
                   :zipcode,
                   :country
                   )
  end
end

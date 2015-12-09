class Admin::UsersController < Admin::BaseController
  def index
    @business = current_business
    @admins = current_business.users
  end

  def edit
    @business = current_business
    @admin_user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if current_user && current_user.id == @user.id
      if current_user.update_attributes(update_admin_user_params)
        flash[:notice] = "Admin Updated!"
        redirect_to admin_dashboard_path
      else
        flash[:error] = @user.errors.full_messages.join(", ")
        redirect_to :back
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    user.roles.delete(2)
    user.businesses.delete(params[:business_id])
    user.roles << Role.find_by(name: "registered_user")
    flash[:notice] = "User account has been deactivated"
    redirect_to admin_business_users_path(params[:business_id])
  end

  private

  def update_admin_user_params
    params.require(:user).permit(
                                 :email,
                                 :first_name,
                                 :last_name,
                                 :password
                                 )
  end
end

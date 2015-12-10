class Admin::UsersController < Admin::BaseController
  def index
    @business = current_business
    @admins = current_business.users.select { |user| user.business_admin? }
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
        redirect_to admin_business_users_path(business_name: params[:business_name])
      else
        flash[:error] = @user.errors.full_messages.join(", ") + "╰( ◕ ^ ◕ )╯"
        redirect_to :back
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    role = Role.find_by(name: "business_admin")
    user.roles.delete(role)
    user.roles << Role.find_by(name: "registered_user")
    flash[:notice] = "User account has been deactivated"
    redirect_to admin_business_users_path(slug: params[:business_name])
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

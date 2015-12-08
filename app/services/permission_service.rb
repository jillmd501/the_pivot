class PermissionService
  attr_reader :user, :controller, :action

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action = action

    if user.platform_admin?
      platform_admin_permissions
    elsif user.business_admin?
      business_admin_permissions
    elsif user.registered_user?
      user_permissions
    else
      guest_permissions
    end
  end

  private

  def platform_admin_permissions
    return true if controller == "welcome"
    return true if controller == "users" && action.in?(%w(index show new update edit))
    return true if controller == "sessions" && action.in?(%w(new create destroy edit show))
    return true if controller == "businesses" && action.in?(%w(index new create destroy edit show))
    return true if controller == "photos" && action.in?(%w(index new create destroy edit show download))
    return true if controller == "cart"
    return true if controller == "cart_photos"
    return true if controller == "orders"
    return true if controller == "admin/dashboard"
    return true if controller == "admin/photos"
    return true if controller == "admin/businesses"
    return true if controller == "categories"
  end

  def business_admin_permissions
    return true if controller == "welcome"
    return true if controller == "sessions" && action.in?(%w(new create destroy))
    return true if controller == "users" && action.in?(%w(show new update edit))
    return true if controller == "businesses" && action.in?(%w(index show))
    return true if controller == "photos" && action.in?(%w(index new show create download))
    return true if controller == "cart"
    return true if controller == "cart_photos"
    return true if controller == "orders"
    return true if controller == "admin/dashboard"
    return true if controller == "admin/photos"
    return true if controller == "admin/businesses"
    return true if controller == "categories"
  end

  def user_permissions
    return true if controller == "welcome"
    return true if controller == "sessions" && action.in?(%w(new create destroy))
    return true if controller == "businesses" && action.in?(%w(index show))
    return true if controller == "photos" && action.in?(%w(index show download))
    return true if controller == "users" && action.in?(%w(show update edit))
    return true if controller == "orders"
    return true if controller == "cart"
    return true if controller == "cart_photos"
    return true if controller == "categories"
  end

  def guest_permissions
    return true if controller == "welcome"
    return true if controller == "photos" && action.in?(%w(index show))
    return true if controller == "sessions" && action.in?(%w(new create destroy))
    return true if controller == "users" && action.in?(%w(new create))
    return true if controller == "businesses" && action.in?(%w(show index))
    return true if controller == "cart_photos"
    return true if controller == "cart"
    return true if controller == "orders" && action.in?(%w(create))
    return true if controller == "categories"
  end

end

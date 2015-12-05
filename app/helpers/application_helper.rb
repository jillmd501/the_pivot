module ApplicationHelper
  def platform_admin?
    current_user && current_user.platform_admin?
  end

  def business_admin?
    current_user && current_user.business_admin?
  end

  def registered_user?
    current_user && current_user.registered_user?
  end

  # def registered_user?
  #   if User.find(current_user.id)
  #     true
  #   else
  #     false
  #   end
  # end

end

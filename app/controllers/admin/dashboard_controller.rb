class Admin::DashboardController < Admin::BaseController
  def index
  	if current_user.platform_admin?
  	  @businesses = Business.all	
  	else
  	  @businesses = current_user.businesses
    end
  end
end

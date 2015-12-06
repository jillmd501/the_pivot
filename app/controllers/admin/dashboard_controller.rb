class Admin::DashboardController < Admin::BaseController
  def index
  	@businesses = current_user.businesses
  end
end

class Admin::DashboardController < Admin::BaseController
  def index
    require_admin
  end
end

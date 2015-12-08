class Admin::UsersController < Admin::BaseController
  def index
    @admins = User.all
  end
end

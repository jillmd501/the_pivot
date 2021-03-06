class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin?, :current_photo, :current_business, :businesses, :categories
  before_action :set_cart
  before_action :authorize!

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    (current_business_admin? || current_platform_admin?)
  end

  def current_business_admin?
    current_user && current_user.business_admin?
  end

  def current_platform_admin?
    current_user && current_user.platform_admin?
  end

  def current_permission
    @current_permission ||= PermissionService.new(current_user)
  end

  def authorize!
    unless authorized?
      flash[:error] = "I don't know you!"
      redirect_to root_url
    end
  end

  def authorized?
    current_permission.allow?(params[:controller], params[:action])
  end

  def valid_login?
    @user && @user.authenticate(params[:session][:password])
  end

  def current_business
    if params[:name]
      Business.find_by(slug: params[:name])
    else
      Business.find_by(slug: params[:business_name])
    end
  end

  def current_photo
    Photo.find_by(slug: params[:identifier])
  end

  def current_order
    Order.find(params[:id])
  end

  def businesses
    Business.all
  end

  def categories
    Category.all
  end

  def photo_size(photo_size_name)
    if photo_size_name == "medium"
      photo_size_name = "med"
    end
    photo_size_name.downcase
  end
end

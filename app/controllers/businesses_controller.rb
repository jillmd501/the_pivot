class BusinessesController < ApplicationController
  def index
    @businesses = Business.where(status: "Online")
  end

  def show
    @business = current_business
  end

  def new
    @business = Business.new
  end

  def create
    business = Business.new(business_params)
    if current_user && business.save
      current_user.businesses << business
      flash[:notice] = "Your business is being reviewed"
      redirect_to dashboard_path
    else
      flash.now[:notice] = "Please review your application"
      render :new
    end
  end

  private

    def business_params
      params.require(:business).permit(:name,
                                       :location,
                                       :bio
                                       )
    end
end

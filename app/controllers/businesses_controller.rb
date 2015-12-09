class BusinessesController < ApplicationController
  def index
    @businesses = Business.where(status: "Online")
  end

  def show
    @business = current_business
  end

  def toggle_status
  	if current_business.toggle_status
  		binding.pry
  	else
  		binding.pry
  	end
  end
end

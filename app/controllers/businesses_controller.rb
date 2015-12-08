class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

  def toggle_status
  	if current_business.toggle_status
  		binding.pry
  	else
  		binding.pry
  	end
  end
end

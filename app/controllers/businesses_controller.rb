class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def show
    @business = current_business
  end
end

class Admin::BusinessesController < ApplicationController
	def edit
		@business = current_business
	end

	def update
		if current_business.update_attributes(business_params)
			flash[:notice] = "You did the thing! (つ▀¯▀)つ"
			redirect_to admin_dashboard_path
		else
			flash[:error] = "Something went wrong! ໒( ･ Ĺ̯ ･ )७"
			redirect_to :back
		end
	end

	private

		def business_params
			params.require(:business).permit(:name,
																			 :location,
																			 :bio)
		end
end

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

	def toggle_status
		if current_business.status == "Offline"
			if check_if_new(current_business)
				current_business.users.first.roles << Role.find_by(name: "business_admin")
			end
			current_business.update_attributes(status: "Online")
		else
			current_business.update_attributes(status: "Offline")
		end
		flash[:notice] = "Business status updated ლ(́◉◞౪◟◉‵ლ)"
		redirect_to admin_dashboard_path
	end

	def check_if_new(business)
		business.users.any?{ |user| user.business_admin?} == false
	end

	private

		def business_params
			params.require(:business).permit(:name,
																			 :location,
																			 :bio)
		end
end

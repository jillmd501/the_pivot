class Business < ActiveRecord::Base
	validates_presence_of :name, :location, :bio, :slug
  has_many :photos
  has_many :user_businesses
  has_many :users, through: :user_businesses
	before_validation :generate_slug

  def toggle_status
  	status = self.status
  	if status == "Online"
  		self.update_attributes(status: "Offline")
  	elsif status == "Offline"
  		self.update_attributes(status: "Online")
    end
  end

	def generate_slug
		self.slug = name.parameterize
	end
end

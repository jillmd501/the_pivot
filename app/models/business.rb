class Business < ActiveRecord::Base
	validates_presence_of :name, :location, :bio, :slug
  has_many :photos
  has_many :user_businesses
  has_many :users, through: :user_businesses
	before_validation :generate_slug

  def toggle_status
  	status = self.status
  	if status == "Online"
  		status = "Oflline"
  	elsif status == "Offline"
  		status = "Online"
  	end
  	self.save
  end

	def generate_slug
		self.slug = name.parameterize
	end
end

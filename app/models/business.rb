class Business < ActiveRecord::Base
	validates_presence_of :name, :location, :bio, :slug
  has_many :photos
  has_many :user_businesses
  has_many :users, through: :user_businesses
	before_validation :business_name

	def business_name
		self.slug = name.parameterize
	end
end

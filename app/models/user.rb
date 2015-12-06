class User < ActiveRecord::Base
	has_secure_password

	belongs_to :business

	validates :username, presence: true, uniqueness: true
	validates :password, presence: true

  has_many :orders
  has_many :user_businesses
  has_many :businesses, through: :user_businesses

	has_many :user_roles
  has_many :roles, through: :user_roles

	has_attached_file :avatar, styles: { thumbnail: "64x64", small: "200x200" }
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def platform_admin?
		roles.exists?(name: "platform_admin")
	end

	def business_admin?
		roles.exists?(name: "business_admin")
	end

	def registered_user?
		roles.exists?(name: "registered_user")
	end
end

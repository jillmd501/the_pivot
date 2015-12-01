class User < ActiveRecord::Base
	has_secure_password
	
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true
  has_many :orders
  has_many :user_businesses
  has_many :businesses, through: :user_businesses
end

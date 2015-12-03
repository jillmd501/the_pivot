class User < ActiveRecord::Base
	has_secure_password
	
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true
	has_one :address
  has_many :orders
  has_many :user_businesses
  has_many :businesses, through: :user_businesses


  def set_address(user_address_params)
  	address = Address.new(user_address_params)

  	self.address = address if address.save
  end
end

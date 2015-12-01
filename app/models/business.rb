class Business < ActiveRecord::Base
  has_many :photos
  has_many :user_businesses
  has_many :users, through: :user_businesses
end

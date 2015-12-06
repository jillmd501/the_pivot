class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_photos
  has_many :orders, through: :order_photos
end

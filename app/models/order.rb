class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_trips
  has_many :trips, through: :order_trips
end
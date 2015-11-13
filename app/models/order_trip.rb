class OrderTrip < ActiveRecord::Base
  validates :subtotal, presence: true
  validates :quantity, presence: true
  belongs_to :order
  belongs_to :trip
end

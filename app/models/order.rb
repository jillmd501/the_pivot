class Order < ActiveRecord::Base
  validates :total, presence: true
  belongs_to :user
  has_many :order_trips
  has_many :trips, through: :order_trips
  enum status: %w(Ordered Paid Cancelled Completed)

  def trips
    self.order_trips.map do |order_trip|
      CartTrip.new(order_trip.trip, order_trip.quantity, order_trip.subtotal)
    end
  end

  def self.by_status
    statuses = {"Ordered" => [],
                "Paid" => [],
                "Cancelled" => [],
                "Completed" => []}
    Order.all.each do |order|
      statuses[order.status] << order
    end
    statuses
  end
end

class OrderCompletion
  def self.create(user, cart)
    order = user.orders.new(total: 0,
                            status_timestamp: formatted_time,
                            status: 0)
    cart.photos.each do |photo|
      order.total += photo.size.price
    end
    order.save
  end

  def self.update_status(order, status)
    order.update(status: status,
                 status_timestamp: formatted_time)
  end

  def self.cancel(order)
    order.update(status: 2,
                 status_timestamp: formatted_time)
  end

  def self.formatted_time
    Time.now.strftime("%B %e, %Y")
  end
end
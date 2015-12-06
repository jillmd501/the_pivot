class OrderCompletion
  def self.create(user, cart)
    order = user.orders.new(total: 0,
                            status_timestamp: formatted_time)
    if order.save
      cart.contents.each do |photo_id, size_id|
        size = Size.find(size_id)
        OrderPhoto.create(photo_id: photo_id, order_id: order.id, size_id: size_id)
        order.total += size.price
        order.save
      end
    end
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
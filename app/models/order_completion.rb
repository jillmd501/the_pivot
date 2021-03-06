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
        UserMailer.order_confirmation(user, order).deliver_now
    end
  end

  def self.cancel(order)
    order.update(status: "Cancelled",
                 status_timestamp: formatted_time)
  end

  def self.formatted_time
    Time.now.strftime("%B %e, %Y")
  end
end

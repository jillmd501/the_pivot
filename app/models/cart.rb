class Cart
  attr_accessor :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_photo(photo_id)
    contents[photo_id.to_s] ||= 0
    contents[photo_id.to_s] += 1
  end

  def total_count
    contents.values.sum
  end

  def remove(photo_id)
    contents.delete(photo_id.to_s)
  end

  def update(photo_id, update_type)
    if update_type == "add"
      contents[photo_id.to_s] += 1
    else
      contents[photo_id.to_s] -= 1
    end
    remove(photo_id) if contents[photo_id.to_s] == 0
  end

  def photos
    contents.map do |photo_id, quantity|
      photo = Photo.find(photo_id)
      subtotal = photo.price * quantity
      CartPhoto.new(photo, size, subtotal)
    end
  end

  def total_cost
    photos.map do |cart_photo|
      cart_photo.price * cart_photo.quantity
    end.reduce(:+)
  end
end

class Cart
  attr_accessor :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_photo(photo_id, size)
    contents[photo_id.to_s] ||= 0
    contents[photo_id.to_s] += size.to_i
  end

  def total_count
    contents.values.count
  end

  def remove(photo_id)
    contents.delete(photo_id.to_s)
  end

  def photos
    contents.map do |photo_id, size|
      photo = Photo.find(photo_id)
      size = Size.find(size)
      CartPhoto.new(photo, size)
    end
  end

  def total_cost
    contents.map do |photo_id, size_id|
      size = Size.find(size_id).price
    end.reduce(:+)
  end
end

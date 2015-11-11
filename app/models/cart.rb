class Cart
  attr_accessor :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_trip(trip_id)
    contents[trip_id.to_s] ||= 0
    contents[trip_id.to_s] += 1
  end

  def total
    contents.values.sum
  end

  def remove(trip_id)
    contents.delete(trip_id.to_s)
  end
end

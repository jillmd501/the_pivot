class Cart
  attr_accessor :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_category(category_id)
    contents[category_id.to_s] ||= 0
    contents[category_id.to_s] += 1
  end

  def total
    contents.values.sum
  end

  def remove(category_id)
    contents.delete(category_id.to_s)
  end

  def update(category_id, update_type)
    if update_type == "add"
      contents[category_id.to_s] += 1
    else
      contents[category_id.to_s] -= 1
    end
    remove(category_id) if contents[category_id.to_s] == 0
  end
end

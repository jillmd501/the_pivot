class CartPhoto < SimpleDelegator
  attr_reader :size

  def initialize(photo, size)
    super(photo)
    @size = size
  end

  def business
    Business.find(self.business_id)
  end
end

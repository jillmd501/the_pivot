class CartPhoto < SimpleDelegator
  attr_reader :size, :subtotal

  def initialize(photo, size, subtotal)
    super(photo)
    @size = size
    @subtotal = subtotal
  end
end

class CartTrip < SimpleDelegator
  attr_reader :quantity, :subtotal

  def initialize(trip, quantity, subtotal)
    super(trip)
    @quantity = quantity
    @subtotal = subtotal
  end
end

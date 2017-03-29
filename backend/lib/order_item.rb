class OrderItem
  attr_reader :order, :product

  def initialize(order:, product:)
    @order = order
    @product = product
  end

  def discount
    @product.discount
  end

  def process(address)
    product.process(address)
  end

  def total
    10
  end
end
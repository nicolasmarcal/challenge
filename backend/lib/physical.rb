require "./lib/product"
class Physical < Product

  def process(address)
    generate_shipping_label(address)
  end
end
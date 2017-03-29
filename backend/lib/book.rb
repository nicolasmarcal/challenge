require "./lib/physical"
class Book < Physical

  TAX_FREE_TEXT = "\nItem isento de impostos conforme disposto na Constituição Art. 150, VI, d"

  def process(address)
    generate_shipping_label(address) + TAX_FREE_TEXT
  end

end
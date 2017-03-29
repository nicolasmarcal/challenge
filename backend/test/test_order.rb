require "test/unit"
Dir[File.join(".", "**/*.rb")].each {|file| require file }

class TestOrder < Test::Unit::TestCase
  def test_order
    foolano = Customer.new
    book = Product.build(name: 'Awesome book', type: :book)
    book_order = Order.new(foolano)
    book_order.add_product(book)

    payment_book = Payment.new(order: book_order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))
    payment_book.pay
    assert_equal(true, payment_book.paid?) # < true
  end

  def test_order_discount
    foolano = Customer.new
    digital = Product.build(name: 'Digital', type: :digital)
    digital_order = Order.new(foolano)
    digital_order.add_product(digital)

    payment_digital = Payment.new(order: digital_order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))
    payment_digital.pay
    assert_equal(0.0, digital_order.total_amount) # with discount
  end
end
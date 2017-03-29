class Product
  # use type to distinguish each kind of product: physical, book, digital, membership, etc.
  attr_reader :name, :type, :price

  TYPES = {
    book: "Book",
    physical: "Physical",
    membership: "Membership",
    digital: "Digital"
  }

  def initialize(name:, type:)
    @name, @type = name, type
  end

  def self.build(name:, type:)
    if TYPES.include?(type)
      eval(TYPES[type]).new(name: name, type: type)
    else
      raise NotImplementedError.new("undefined type: #{type}")
    end
  end

  def process(address)
  end

  def discount
    0
  end

  protected

  def generate_shipping_label(address)
    "ZIP_CODE = #{address.zipcode}"
  end
end
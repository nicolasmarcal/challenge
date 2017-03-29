require "./lib/product"
class Membership < Product

  def process(address)
    #activate
    notify_client
  end

  private

  def notify_client
    # send e-mail
  end
end
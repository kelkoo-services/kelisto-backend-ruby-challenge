require_relative 'product'
require_relative 'cart_item'

class Cart
  attr_reader :products, :rules

  def initialize(rules = nil)
    @products = {}
    @rules = rules || []
  end

  def scan(code)
    add_product Product.find(code)
  end

  def add_product(product, qtt = 1)
    if products[product.code]
      products[product.code].qtt += qtt
    else
      products[product.code] = CartItem.new(product, qtt)
    end

    self
  end

  def total_price
    p = products.inject(0) {|sum,v| sum+=v[1].total_price}
    p.round(2)
  end

  def total_items
    products.inject(0) {|sum,v| sum+=v[1].qtt}
  end

  def distinct_items
    products.keys.count
  end

end

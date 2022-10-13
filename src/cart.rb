require_relative 'product'
require_relative 'cart_item'
require_relative 'discount'

class Cart
  attr_reader :products

  def initialize(discount_rules = {})
    @products  = {}
    @discounts = Discounts::Manager.new(self, discount_rules)
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
    products_price + discounts_price
  end

  def total_items
    products.inject(0) {|sum,v| sum+=v[1].qtt}
  end

  def distinct_items
    products.keys.count
  end

  def products_price
    p = products.inject(0) {|sum,v| sum+=v[1].total_price}
    p.round(2)
  end

  def discounts_price
    discounts.total_price
  end

  def discounts
    @discounts.apply_discounts
  end

  def to_s
    str = products.values.map(&:to_s).join("\n")
    str += "\n------------------\n"
    str += discounts.to_s
    str += "\n------------------\n"
    str += sprintf("%25s  %8.2f", 'TOTAL', total_price)
  end

  # just a quick helper to create & fill a cart easily (for testing/debug/interactive stuff)
  def self.build_cart(products = '', with_discounts = true)
    cart = Cart.new(with_discounts ? Data.discounts : nil)
    products.split(',').each {|p| cart.scan p}

    cart
  end
end

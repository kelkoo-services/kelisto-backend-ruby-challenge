require_relative 'basket'

class Checkout
  def initialize(discount_hash = nil, products_hash = {}, basket_klass: Basket)
    @products_hash = products_hash
    @basket = basket_klass.new(discount_hash, products_hash)
    @basket_content = Hash.new(0)
  end

  def scan(item_code)
    fail "#{item_code} is not a valid item code" unless product_in_basket?(item_code)
    @basket_content[item_code] += 1
  end

  def total
    '£%.2f' % get_basket_content_cost_with_decimals
  end

  private

  attr_reader :products_hash, :basket, :basket_content

  def get_basket_content_cost_with_decimals
    (basket.get_total_with_discounts(basket_content) / 100.0).round(2)
  end

  def product_in_basket?(item_code)
    products_hash.key?(item_code)
  end
end



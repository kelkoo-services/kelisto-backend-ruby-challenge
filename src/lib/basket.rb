require_relative 'discounts/buy_one_get_one_free'
require_relative 'discounts/three_or_more_get_discount'

class Basket

  attr_reader :products_hash, :discount_hash

  def initialize(discount_hash = {}, products_hash = {})
    @discount_hash = discount_hash
    @products_hash = products_hash
  end

  def get_total_with_discounts(basket_content)
    apply_discounts( sum_without_discounts(basket_content), basket_content)
  end

  private

  def sum_without_discounts(basket_content)
    basket_content.reduce(0) do |sum, (product_code, num)|
      sum += (products_hash[product_code][:price] * num).to_i
    end
  end

  def apply_discounts(cost_before_discounts, basket_content)
    cost_with_discounts = cost_before_discounts
    discount_hash.keys.each do |discount_klass|
      cost_with_discounts -= Object.const_get(discount_klass).get_quantity_to_discount(basket_content, discount_hash[discount_klass])
    end
    return cost_with_discounts
  end

end

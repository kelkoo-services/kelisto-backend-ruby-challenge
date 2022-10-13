require_relative '../discount'

module Discounts
  class BulkLowerPrice < ::Discount
    attr_accessor :buy_qtt, :buy_product, :bulk_price

    # buy 3 units of GR1 to get lower price
    # buy_qtt: 3
    # buy_product: 'GR1'
    # bulk_price: 3.2

    def apply_on(cart)
      purchased = cart.products[buy_product]
      return false unless purchased && purchased.qtt >= buy_qtt

      @amount = (purchased.price - bulk_price) * -purchased.qtt
    end

  end
end

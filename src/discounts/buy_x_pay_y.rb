require_relative '../discount'

module Discounts
  class BuyXPayY < ::Discount
    attr_accessor :buy_qtt, :buy_product, :pay_qtt

    # buy 3 units of GR1 to get 1 free (3x2)
    # buy_qtt: 3
    # buy_product: 'GR1'
    # pay_qtt: 2

    def apply_on(cart)
      purchased = cart.products[buy_product]
      return false unless purchased && purchased.qtt >= buy_qtt

      times = purchased.qtt / buy_qtt
      @amount = (buy_qtt - pay_qtt) * times * -purchased.price
    end
  end
end

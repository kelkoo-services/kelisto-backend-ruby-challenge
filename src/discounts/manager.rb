require_relative '../discount'

module Discounts
  class Manager
    attr_reader :discounts

    def initialize(cart, rules)
      @cart  = cart
      @rules = rules || {}
      @discounts = {}
    end

    def apply_discounts
      @discounts = {}
      @rules.each do |code, conf|
        discount = Discount.build(conf)
        amount   = discount.apply_on(@cart)
        next unless amount

        @discounts[discount.code] = discount
      end
      self
    end

    def total_price
      amount = @discounts.inject(0) {|sum,v| sum+=v[1].amount}
      amount.round(2)
    end

    def to_s
      @discounts.values.map(&:to_s).join("\n")
    end
  end
end

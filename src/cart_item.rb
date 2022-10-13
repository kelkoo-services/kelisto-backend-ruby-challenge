require 'forwardable'

class CartItem
  extend Forwardable
  attr_accessor :product, :qtt

  # this is rails :(
  # delegate :code, :name, :amount, to: :product
  def_delegators :@product, :code, :name, :price

  def initialize(product, qtt = 1)
    @product = product
    @qtt = qtt
  end

  def total_price
    (product.price * qtt).round(2)
  end

  def to_s
    sprintf("%-6s%-16.12s %2dx = %6.2f", code, name, qtt, total_price.round(2))
  end
end

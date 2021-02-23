# frozen_string_literal: true

require_relative '../repositories/order_repository'
require_relative '../repositories/item_repository'
require_relative '../repositories/user_repository'
require_relative '../views/view_order'
require_relative '../views/view_item'
require_relative '../views/view_session'
require_relative '../models/order'
require 'byebug'

class OrdersController
  def initialize(item_repository, user_repository, order_repository)
    @order_repository = order_repository
    @item_repository = item_repository
    @user_repository = user_repository
    @view = ViewOrder.new
    @view_item = ViewItem.new
  end

  def add(user)
    cart = []
    items = @item_repository.all

    loop do
      @view_item.display(items)
      @view.display_order_progress(cart, total_amount(cart))
      item_index = @view.ask_for_index
      next unless item_index.to_i <= items.length
      break if item_index == 'c'

      cart << items[item_index.to_i - 1]
    end

    @view.checkout
    @view.display_order_progress(cart, total_amount(cart))

    order = Order.new(items: checkout_code(cart), user: user, total: total_amount(cart))
    @order_repository.create(order)
  end

  def total_amount(items_new)
    sum = 0
    if buy_one_get_one(1, items_new, sum)
      sum += buy_one_get_one(1, items_new, sum)
    elsif discount_if_more_items(2, 3, items_new, 4.50, sum)
      sum += discount_if_more_items(2, 3, items_new, 4.50, sum)
    else
      items_new.each { |item| sum += item.price }
    end
    sum
  end

  def list
    display_orders
  end

  def list_my_orders(user)
    my_orders = @order_repository.all do |order|
      order.user.username == user.username
    end
    @view.display(my_orders)
  end

  private

  def discount_if_more_items(index, cuantity, items, price, plus)
    if items.count(@item_repository.find(index)) >= cuantity
      sum = plus
      items.each { |item| sum += item.id == 2 ? price : item.price }
      sum
    else
      false
    end
  end

  def buy_one_get_one(index, items, plus)
    sum = plus
    if items.count(@item_repository.find(index)) >= 2
      sum += -@item_repository.find(index).price
      items.each { |item| sum += item.price }
      sum
    else
      false
    end
  end

  def checkout_code(items)
    arr = []
    items.each { |item| arr << item.code }
    arr.join(' | ')
  end

  def display_orders
    orders = @order_repository.all
    @view.display(orders)
  end
end

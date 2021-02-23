require_relative '../repositories/order_repository'
require_relative '../repositories/item_repository'
require_relative '../repositories/user_repository'
require_relative '../views/view_order'
require_relative '../views/view_item'
require_relative '../views/view_session'
require_relative '../models/order'
require "byebug"

class OrdersController
  def initialize(item_repository, user_repository, order_repository)
    @order_repository = order_repository
    @item_repository = item_repository
    @user_repository = user_repository
    @view = ViewOrder.new
    @view_item = ViewItem.new
  end

  # rubocop: disable Metrics/MethodLength

  def add(user)
    items_new = []

    loop do
      items = @item_repository.all
      @view_item.display(items)
      @view.display_order_progress(items_new, total_amount(items_new))
      item_index = @view.ask_for_index
      if item_index.to_i <= items.length
        break if item_index == 'c' || (0..items.length)
        items_new << items[item_index.to_i - 1]
      end
    end
    @view.checkout
    @view.display_order_progress(items_new, total_amount(items_new))

    items_string = items_csv(items_new)

    order = Order.new(items: items_string, user: user, total: total_amount(items_new))
    @order_repository.create(order)
  end

  # rubocop: enable Metrics/MethodLength

  def list
    display_orders
  end

  def list_my_orders(user)
    my_orders = @order_repository.all do |order|
      order.user.username == user.username
    end
    @view.display(my_orders)
  end

  def total_amount(items_new)
    sum = 0
    if items_new.count(@item_repository.find(1)) >= 2
      sum += -3.11
      items_new.each do |item|
        sum += item.price
      end
    elsif items_new.count(@item_repository.find(2)) >= 3
      items_new.each do |item|
        if item.id == 2
          sum += 4.50
        else
          sum += item.price
        end
      end
    else
      items_new.each do |item|
        sum += item.price
      end
    end
    sum
  end

  def items_csv(items)
    array = []
    items.each do |item|
      array << item.code
    end
    array.join(' | ')
  end

  def display_orders
    orders = @order_repository.all
    @view.display(orders)
  end
end


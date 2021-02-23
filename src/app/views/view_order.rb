# frozen_string_literal: true

class ViewOrder
  def display(orders)
    all_orders
    orders.each_with_index do |order, index|
      puts "#{index + 1} - Name: #{order.user.username}"
      puts "    Items: #{order.items}"
      puts "\n"
      puts "    TOTAL: ￡#{order.total.round(2)}"
      puts "\n"
    end
  end

  def ask_for_index
    puts "Which item do you want to scan? (Press 'c' to Checkout)"
    print '> '
    gets.chomp
  end

  def display_order_progress(items, total_amount)
    items.each do |item|
      puts "1x #{item.code} - #{item.name}"
    end
    puts "\n"
    puts "TOTAL: ￡#{total_amount.round(2)}"
    puts "\n"
  end

  def checkout
    puts '-------------------------------------------'
    puts ' 🍵🍓☕️         CHECKOUT          ☕️🍓🍵'
    puts '-------------------------------------------'
    puts "\n"
  end

  def all_orders
    print `clear`
    puts '-------------------------------------------'
    puts ' 🍵🍓☕️        ALL ORDERS         ☕️🍓🍵'
    puts '-------------------------------------------'
    puts "\n"
  end
end

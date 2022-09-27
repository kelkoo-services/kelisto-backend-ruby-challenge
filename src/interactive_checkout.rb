#!/usr/bin/env ruby

class Checkout
  attr_accessor :items

  def initialize
    @items = []
  end

  def scan(code)
    case code
    when 'GR1'
      add_tea
    when 'SR1'
      add_strawberrie
    when 'CF1'
      add_coffee
    else
      puts 'That product is not available'
    end
  end

  def add_tea
    it = Item.new('GR1', 3.11)
    @items.push(it)
  end

  def add_strawberrie
    it = Item.new('SR1', 5.0)
    @items.push(it)
  end

  def add_coffee
    it = Item.new('CF1', 11.23)
    @items.push(it)
  end

  def total
    puts "Basket: #{print_basket(@items)}"

    princing_rules

    puts "Your total is: £#{@items.sum(&:price)}"
  end

  def princing_rules
    teas = @items.select { |x| x.code == 'GR1' }
    tea_rule(teas) if teas.count.positive?

    strawberries = @items.select { |x| x.code == 'SR1' }
    strawberrie_rule_on(strawberries) if strawberries.count >= 3
    strawberrie_rule_off(strawberries) if strawberries.count < 3
  end

  def tea_rule(teas)
    teas.each_with_index do |tea, index|
      if index.odd?
        tea.price = 0.0
        next
      end
      tea.price = 3.11
    end
  end

  def strawberrie_rule_on(strawberries)
    strawberries.each do |straw|
      straw.price = 4.5
    end
  end

  def strawberrie_rule_off(strawberries)
    strawberries.each do |straw|
      straw.price = 5.0
    end
  end

  def print_basket(list)
    all = ''
    list.each do |ll|
      all += "#{ll.code}, "
    end
    all.delete_suffix(', ')
  end

  def clear
    @items = []
  end

  def rm(code)
    product_to_rm = @items.index { |x| x.code == code }
    @items.delete_at(product_to_rm) unless product_to_rm.nil?
  end

  def welcome
    puts '________________________________________________________'
    puts 'Welcome to the interactive Checkout'
    puts 'Please enter the products that you want to buy'
    puts ''
    puts 'Our products are:'
    puts 'GR1: Green tea / SR1: Strawberries / CF1: Coffee'
    puts ''
  end

  def commands
    puts '-----'
    puts 'Commands:'
    puts 'If you want to add a product, type "scan" and de products code Ex: `scan("GR1")`'
    puts 'If you want to check the total, type "total"'
    puts 'If you want to remove one product, type `rm("GR1")`'
    puts 'If you want to clear the cart, type "clear"'
    puts 'If you want to cancel or exit, type "exit"'
    puts '-----'
    puts 'If you want to run the test, type "run_tests"'
    puts '________________________________________________________'
  end

  def run_tests
    test1
    test2
    test3
    test4
    test5
    test6
    test7
    test8
    test9
  end

  def test1
    puts 'Total price expected: £22.45'
    scan('GR1')
    scan('SR1')
    scan('GR1')
    scan('GR1')
    scan('CF1')
    total
    clear
    puts ''
  end

  def test2
    puts 'Total price expected: £3.11'
    scan('GR1')
    scan('GR1')
    total
    clear
    puts ''
  end

  def test3
    puts 'Total price expected: £16.61'
    scan('SR1')
    scan('SR1')
    scan('GR1')
    scan('SR1')
    total
    clear
    puts ''
  end

  def test4
    puts 'Total price expected: £9.33'
    scan('GR1')
    scan('GR1')
    scan('GR1')
    scan('GR1')
    scan('GR1')
    scan('GR1')
    total
    clear
    puts ''
  end

  def test5
    puts 'Total price expected: £9.33'
    scan('GR1')
    scan('GR1')
    scan('GR1')
    scan('GR1')
    scan('GR1')
    total
    clear
    puts ''
  end

  def test6
    puts 'Total price expected: £3.11'
    scan('GR1')
    total
    clear
    puts ''
  end

  def test7
    puts 'Total price expected: £38.68'
    scan('GR1')
    scan('SR1')
    scan('GR1')
    scan('GR1')
    scan('CF1')
    scan('SR1')
    scan('GR1')
    scan('CF1')
    total
    clear
    puts ''
  end

  def test8
    puts 'Total price expected: £14.34'
    scan('XR1')
    scan('GR1')
    scan('CF1')
    scan('TR1')
    total
    clear
    puts ''
  end

  def test9
    puts 'Total price expected: £0'
    total
    scan('')
    total
    clear
    puts ''
  end
end

class Item
  attr_accessor(:code, :price)

  def initialize(code, price)
    @code = code
    @price = price
  end
end

if __FILE__ == $PROGRAM_NAME
  mg = Checkout.new
  mg.welcome
  mg.commands
  instru = gets.chomp
  until instru == 'exit'
    iii = "mg.#{instru.to_sym}"
    eval(iii)

    instru = gets.chomp
  end

  puts 'Goodbye'
end

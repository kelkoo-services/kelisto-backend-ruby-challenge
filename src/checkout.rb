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
    puts 'You chose "Green tea"'
    it = Item.new('GR1', 3.11)
    @items.push(it)
  end

  def add_strawberrie
    puts 'You chose "Strawberries"'
    it = Item.new('SR1', 5.0)
    @items.push(it)
  end

  def add_coffee
    puts 'You chose "Coffee"'
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
end

class Item
  attr_accessor(:code, :price)

  def initialize(code, price)
    @code = code
    @price = price
  end
end

class Checkout

  require 'yaml'

  def initialize(products_list)
    @pricing_products = YAML.load_file("#{products_list}.yml")
    @list_products = []
    @total = 0.0
  end

  def product_price code
    @pricing_products[code.uppercase]['price']
  end

  def get(position)
    @list_products[position]
  end

  def scan item
    @list_products << item
  end

  def show
    puts "Basket: #{@list_products}"
  end

  def clean
    @list_products = []
    @total = 0
  end

  def total
    total = 0

    products_list.keys.each do |product|
      total_product = @list_products.count(product)
      total += apply_offer(product, total_product)
    end

    puts "Total price expected: #{total}"
  end

  def apply_offer code, amount
    case code
    when 'GR1'
      amount = amount > 1 ? (amount - 1) : amount 
      amount * @pricing_products['products'][code]['price']
    when 'SR1'
      price = amount > 2 ? @pricing_products['products'][code]['low_price'] : @pricing_products['products'][code]['price']
      amount * price
    else
      amount * @pricing_products['products'][code]['price']
    end
  end

  def products_list
    @pricing_products['products']
  end
end
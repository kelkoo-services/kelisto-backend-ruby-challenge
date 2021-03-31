require "./checkout.rb"

co =  Checkout.new('pricing_config')

products = co.products_list.keys

puts "-------- product list --------"
products.each do |product_code|
  puts "->  #{product_code} - #{co.products_list[product_code]['name']} - #{co.products_list[product_code]['price']} £"
end
puts "------------------------------"

puts "------- first example -------"
co.scan('GR1')
co.scan('SR1')
co.scan('CF1')
co.scan('GR1')
co.scan('GR1')

# Total price expected: £22.45
co.show
co.total
puts "-------------------------------"

puts "------- second example -------"
co.clean
co.scan('GR1')
co.scan('GR1')

# Total price expected: £3.11
co.show
co.total
puts "-------------------------------"

puts "------- third example -------"
co.clean
co.scan('SR1')
co.scan('SR1')
co.scan('GR1')
co.scan('SR1')

# Total price expected: £16.61
co.show
co.total
puts "-------------------------------"

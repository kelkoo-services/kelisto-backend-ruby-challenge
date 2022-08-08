require 'io/console'
require 'terminal-table'

require_relative 'lib/checkout'

# Products and Discounts in a hash, it can be the more similar to a database query
products_hash = {
    'GR1' => {name: 'Green tea', price: 311},
    'SR1' => {name: 'Strawberries', price: 500},
    'CF1' => {name: 'Coffee', price: 1123}
}

# In this way, we can add or remove discounts easily. The hash key acts as an identifier of the
# type of discount (className), and is also representative to identify what discount it is.
discount_hash = {
    'BuyOneGetOneFree' => {product_code: 'GR1', discount: products_hash['GR1'][:price]},
    'ThreeOrMoreGetDiscount' => {product_code: 'SR1', min_quantity: 3, discount: 50}
}

checkout = Checkout.new(discount_hash,  products_hash)

puts "Hi! Welcome to Kelisto Market
To insert products in the basket, type the product code and press enter.\n\n"
rows = []
products_hash.each do |product_code, product_info|
  rows << [product_code, product_info[:name], '£%.2f' % (product_info[:price] / 100.0).round(2)]
end
table = Terminal::Table.new :title => "PRODUCTS", :headings => ['Product Code', 'Name', 'Price'], :rows => rows
puts table

puts "\nWhen you finish your purchase, type Checkout and press enter"

text_typed = ''
while text_typed.downcase != 'checkout'
  text_typed = gets.chomp
  if products_hash.key? text_typed
    puts "#{products_hash[text_typed][:name]} added to basket!"
    checkout.scan text_typed
  elsif text_typed.downcase != 'checkout'
    puts 'Bad product code, try again'
  end
end

price = checkout.total
puts "Total of the basket: #{price}"
load 'checkout.rb'



def ppl_menu products
  begin
    puts "Products list:"
    puts "#"*50
    options = []
    products.values.each_with_index do |product,i|
      #options << (i+1).to_s
      options << product.id.to_s
      puts "#{product.id} - #{product.code} - #{product.name}\t#{product.price} #{product.currency}"
    end
    puts "#"*50
    print "Please, select an option from the list and click enter: "
    option = gets.chomp
    is_valid = options.include?(option) && products[option.to_i]
    if !is_valid
      system "clear"
      puts "#"*50
      puts  "Your option ('#{option}') is not included in range  -> #{options.inspect}"
      puts "#"*50
      sleep 3
      system "clear"
    end
  end while !is_valid
  option
end

checkout = CheckOut.new
products = checkout.all_products

begin
  option = ppl_menu products
  system "clear"
  selected_product = products[option.to_i]
  begin
    puts "Your are selected option #{option} - #{selected_product.name}"
    puts "Please select the quantity:"
    quantity = gets.chomp
    valid_quantity = quantity.to_i
  end while !valid_quantity

  valid_quantity.times{ checkout.scan selected_product.id }

  system "clear"
  checkout.total

  puts "Do you want to continue? (y/n)"
  continue = gets.chomp
  system "clear"
end while continue.eql?("y")


system "clear"
puts "Your order:"
checkout.total true
puts "Thx!!!"


puts "Do you want execute tests? (y/n)"
tests = gets.chomp
system "clear"

if tests
  #ONLY REQUIRE
  puts "Installing required gems!!!"
  system "gem install rspec  > /dev/null 2>&1"
  system "gem install rspec-expectations > /dev/null 2>&1"
  puts "It's all right!"
  sleep(2)
  system "clear"
  system "rspec"
end

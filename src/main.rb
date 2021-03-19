load "Models/Checkout.rb"
require "json"

if ARGV.length > 1
    puts "We need exactly one arguments separated in commas!"
    exit
end

if ARGV[0].nil?
    puts "Add one argument!"
    exit
else
    items = ARGV[0].split(',')
end


file = File.read('./Data/pricing_rules.json')
pricing_rules = JSON.parse(file)

co = Checkout.new(pricing_rules)
items.each do |item|
    co.scan(item)
end
price = co.total
if (price['TotalPrice'] != "null")
    puts "Basket: " + price['ItemCodes'] + "\nTotal price expected: £" + price['TotalPrice']
else
    puts "Add a valid argument!"
end

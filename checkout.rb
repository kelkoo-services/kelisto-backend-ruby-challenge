load 'data.rb'

class CheckOut
  attr_accessor :products, :all_products
  def initialize
    data = DataInfo.new
    @products = []
    @all_products ||= get_products data
    @offers ||= get_offers data
  end

  def scan product_id
    self.products << product_id
  end

  #All products list
  def get_products data
    data.load_all_data
  end

  #Offers list
  def get_offers data
    data.load_offers
  end

  #Apply offer
  def apply_offer product,quantity
    if @offers[product.id]
      price = eval(@offers[product.id].offer)
    else
      price = product.price
    end
  end

  #Total
  def total with_details=false
    subtotal=0
    group_by_products = @products.inject({}) { |h,product_id| product = @all_products[product_id]; h[product] ||= 0 ;  h[product] +=1; h }

    group_by_products.each do |product, quantity|
      subtotal += @offers[product.id] ? apply_offer(product,quantity) : product.price * quantity
    end

    if with_details
      puts "#"*50
      group_by_products.each{|k,v| puts "#{k.name} - #{v}"}
      puts "·"*50
    end
    puts "Total: £#{subtotal}"
    puts "#"*50
    subtotal
  end



end

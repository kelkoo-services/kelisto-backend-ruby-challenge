load 'checkout.rb'

RSpec.describe "Offers check", :type => :request do

  describe "Basket: GR1,SR1,GR1,GR1,CF1" do
    it "Total price expected should be eq: £22.45" do
      checkout = CheckOut.new
      products = checkout.all_products
      products_by_code = products.inject({}){|h,p| h[p[1].code] ||= p[0]; h }
      3.times{ checkout.scan products_by_code["GR1"] }
      checkout.scan products_by_code["SR1"]
      checkout.scan products_by_code["CF1"]
      expect("£#{checkout.total}").to  eq("£22.45")
    end
  end

  describe "Basket: GR1,GR1" do
    it "Total price expected should be eq: £3.11" do
      checkout = CheckOut.new
      products = checkout.all_products
      products_by_code = products.inject({}){|h,p| h[p[1].code] ||= p[0]; h }
      2.times{ checkout.scan products_by_code["GR1"] }
      expect("£#{checkout.total}").to  eq("£3.11")
    end
  end

  describe "Basket: SR1,SR1,GR1,SR1" do
    it "Total price expected should be eq: £16.61" do
      checkout = CheckOut.new
      products = checkout.all_products
      products_by_code = products.inject({}){|h,p| h[p[1].code] ||= p[0]; h }
      3.times{ checkout.scan products_by_code["SR1"] }
      checkout.scan products_by_code["GR1"]
      expect("£#{checkout.total}").to  eq("£16.61")
    end
  end

end

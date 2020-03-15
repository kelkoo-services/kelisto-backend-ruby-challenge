require 'json'

load 'products.rb'
load 'offers.rb'

class DataInfo
  def initialize
  end

  def load_all_data
    prices = load_data "product_price_list.json"
    #offers = load_data "product_offer_list.json"

    products = load_products

    products = prices["ProductsPrice"].inject({}) do |h,pp|
      if products[pp["product_id"]]
        products[pp["product_id"]].price = pp["price"]
        products[pp["product_id"]].currency = pp["currency"]
        h[pp["id"]] = products[pp["product_id"]]
      else
        puts "Product #{p.id} without price!"
      end
      h
    end
    products
  end

  def load_products
    prdtcs = load_data "product_list.json"
    prdtcs["Products"].inject({}) { |h,p| h[p['id']] = Product.new(p['id'], p['name'], p['code']); h }
  end

  def load_offers
    offers = load_data "product_offer_list.json"
    offers["ProductsOffer"].inject({}) { |h,o| h[o['product_id']] = Offer.new(o["id"], o["product_id"], o["offer"]); h }
  end

  def load_data file_name
    file = File.open( File.join(File.dirname(__FILE__)+"/data/", file_name), 'r+' )
    JSON.load file
  end


end

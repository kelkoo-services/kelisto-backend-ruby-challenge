class BuyOneGetOneFree

  def self.get_quantity_to_discount(basket_content, params)
    return basket_content[params[:product_code]] >= 2 ? params[:discount] : 0
  end

end

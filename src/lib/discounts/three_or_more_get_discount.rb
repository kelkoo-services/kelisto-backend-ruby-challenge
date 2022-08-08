class ThreeOrMoreGetDiscount

  def self.get_quantity_to_discount(basket_content, params)
    return basket_content[params[:product_code]] >= params[:min_quantity] ? params[:discount] * basket_content[params[:product_code]] : 0
  end

end

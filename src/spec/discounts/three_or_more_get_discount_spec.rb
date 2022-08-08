require_relative '../../lib/discounts/three_or_more_get_discount'

describe ThreeOrMoreGetDiscount do

  describe '#get_quantity_to_discount' do
    it 'is expected to apply a discount in every product if buy 3 or more' do
      basket_content = { "SR1" => 4 }
      params = {product_code: 'SR1', min_quantity: 3, discount: 50}
      expect(ThreeOrMoreGetDiscount.get_quantity_to_discount(basket_content, params)).to eq 200
    end

    it 'is expected to apply no discount if basket content contains less than 3 products' do
      basket_content = { "SR1" => 2 }
      params = {product_code: 'SR1', min_quantity: 3, discount: 50}
      expect(ThreeOrMoreGetDiscount.get_quantity_to_discount(basket_content, params)).to eq 0
    end
  end
end

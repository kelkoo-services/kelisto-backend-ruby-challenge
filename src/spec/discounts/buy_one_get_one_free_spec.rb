require_relative '../../lib/discounts/buy_one_get_one_free'

describe BuyOneGetOneFree do

  describe '#get_quantity_to_discount' do
    it 'is expected to apply the discount on orders with 2 products' do
      basket_content = { "GR1" => 2 }
      params = {product_code: 'GR1', discount: 311}
      expect(BuyOneGetOneFree.get_quantity_to_discount(basket_content, params)).to eq 311
    end

    it 'is expected to apply the same discount on orders with more than 2 products' do
      basket_content = { "GR1" => 4 }
      params = {product_code: 'GR1', discount: 311}
      expect(BuyOneGetOneFree.get_quantity_to_discount(basket_content, params)).to eq 311
    end

    it 'is expected to apply no discount on orders less than 2 products' do
      basket_content = { "GR1" => 1 }
      params = {product_code: 'GR1', discount: 311}
      expect(BuyOneGetOneFree.get_quantity_to_discount(basket_content, params)).to eq 0
    end
  end
end

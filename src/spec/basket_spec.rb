require_relative '../lib/basket'
require_relative '../lib/discounts/buy_one_get_one_free'
require_relative '../lib/discounts/three_or_more_get_discount'

describe Basket do

  let(:products) {{
      'GR1' => {name: 'Green tea', price: 311},
      'SR1' => {name: 'Strawberries', price: 500},
      'CF1' => {name: 'Coffee', price: 1123}
  }
  }
  let(:discounts) {{
      'BuyOneGetOneFree' => {product_code: 'GR1', discount: products['GR1'][:price]},
      'ThreeOrMoreGetDiscount' => {product_code: 'SR1', min_quantity: 3, discount: 50}
  }
  }

  subject { Basket.new(discounts, products) } # Create an instance of the class in the rspec

  describe '#get_total_with_discounts' do

    it 'is expected to calculate basket without any bonuses' do
      basket_content = { "GR1" => 1, "SR1" => 1 }
      expect(subject.get_total_with_discounts( basket_content)).to eq 811
    end

    it 'is expected to be able to apply a given discount of 50 in Strawberries' do
      basket_content = { "SR1" => 3 }
      allow(BuyOneGetOneFree).to receive(:get_quantity_to_discount).with(basket_content, subject.discount_hash['BuyOneGetOneFree']).and_return(0)
      allow(ThreeOrMoreGetDiscount).to receive(:get_quantity_to_discount).with(basket_content, subject.discount_hash['ThreeOrMoreGetDiscount']).and_return(150)
      # allow(subject).to receive(:apply_discounts).with(15, basket_content)<
      expect(subject.get_total_with_discounts( basket_content)).to eq 1350
    end

    it 'is expected to be able to apply a given discount of one Green tea' do
      basket_content = { "GR1" => 3 }
      allow(BuyOneGetOneFree).to receive(:get_quantity_to_discount).with(basket_content, subject.discount_hash['BuyOneGetOneFree']).and_return(311)
      allow(ThreeOrMoreGetDiscount).to receive(:get_quantity_to_discount).with(basket_content, subject.discount_hash['ThreeOrMoreGetDiscount']).and_return(0)
      expect(subject.get_total_with_discounts( basket_content)).to eq 622
    end
  end
end
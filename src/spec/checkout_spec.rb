require_relative '../lib/checkout'

describe Checkout do


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

  let(:basket_klass) { double :Basket_klass, new: basket }
  let(:basket) { double :Basket }
  subject(:checkout) { described_class.new( discounts, products, basket_klass: basket_klass) }

  describe '#scan' do
    it 'is expected to raise an error if given a code that is not in products' do
      expect{ checkout.scan('GR2') }.to raise_error 'GR2 is not a valid item code'
    end
  end

  describe '#total' do
    it 'is expected to return the cost of the basket content' do
      checkout.scan('GR1')
      checkout.scan('GR1')
      checkout.scan('GR1')

      allow(basket).to receive(:get_total_with_discounts).with({'GR1' => 3}).and_return(622)

      expect(checkout.total).to eq '£6.22'
    end
  end
end

require_relative '../../lib/checkout'
require_relative '../../lib/discounts/buy_one_get_one_free'
require_relative '../../lib/discounts/three_or_more_get_discount'

describe 'Integration Specs' do
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

  subject(:checkout) { Checkout.new(discounts, products) }

  it 'A reduction of £0.50 is expected when order 3 or more Strawberries' do
    checkout.scan 'GR1'
    checkout.scan 'SR1'
    checkout.scan 'SR1'
    checkout.scan 'SR1'
    checkout.scan 'CF1'

    expect(checkout.total).to eq '£27.84'
  end

  it 'Buy two Green tea get one free' do
    checkout.scan 'GR1'
    checkout.scan 'GR1'

    expect(checkout.total).to eq '£3.11'
  end

  it 'Buy three Green tea get one free' do
    checkout.scan 'GR1'
    checkout.scan 'GR1'
    checkout.scan 'GR1'

    expect(checkout.total).to eq '£6.22'
  end

  it 'One Green tea free and reduction of £0.50 on Strawberries' do
    checkout.scan 'GR1'
    checkout.scan 'SR1'
    checkout.scan 'GR1'
    checkout.scan 'GR1'
    checkout.scan 'SR1'
    checkout.scan 'SR1'

    expect(checkout.total).to eq '£19.72'
  end

  it 'Test data 1' do
    checkout.scan 'GR1'
    checkout.scan 'SR1'
    checkout.scan 'GR1'
    checkout.scan 'GR1'
    checkout.scan 'CF1'

    expect(checkout.total).to eq '£22.45'
  end

  it 'Test data 2' do
    checkout.scan 'GR1'
    checkout.scan 'GR1'

    expect(checkout.total).to eq '£3.11'
  end

  it 'Test data 3' do
    checkout.scan 'SR1'
    checkout.scan 'SR1'
    checkout.scan 'GR1'
    checkout.scan 'SR1'

    expect(checkout.total).to eq '£16.61'
  end
end

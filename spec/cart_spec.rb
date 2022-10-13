require_relative '../src/cart'

describe Cart do
  context 'Basket: GR1,SR1,GR1,GR1,CF1' do
    let(:cart) do 
      c = Cart.new
      'GR1,SR1,GR1,GR1,CF1'.split(',').each do |id|
        c.scan id
      end
      c
    end

    it 'Has correct products' do
      expect(cart.products.keys.count).to eq 3
      expect(cart.total_items).to eq 5
    end

    it 'Has correct totals' do
      expect(cart.total_price).to eq 25.56
    end
  end

end

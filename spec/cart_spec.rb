require_relative '../src/cart'
require_relative '../src/discount'

describe Cart do
  context "Without discounts" do
    context 'Basket: GR1,SR1,GR1,GR1,CF1' do
      let(:cart) do
        cart = Cart.build_cart('GR1,SR1,GR1,GR1,CF1', false)
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

  context "With active discounts" do
    context 'Basket: GR1,SR1,GR1,GR1,CF1' do
      cart = Cart.build_cart('GR1,SR1,GR1,GR1,CF1', true)

      it 'Has valid totals' do
        expect(cart.total_price).to eq 22.45
      end
    end

    context 'Basket: GR1,GR1' do
      cart = Cart.build_cart('GR1,GR1', true)

      it 'Has valid totals' do
        expect(cart.total_price).to eq 3.11
      end
    end

    context 'Basket: SR1,SR1,GR1,SR1' do
      cart = Cart.build_cart('SR1,SR1,GR1,SR1', true)

      it 'Has valid totals' do
        expect(cart.total_price).to eq 16.61
      end
    end

    context 'Basket: SR1,SR1,GR1,GR1,SR1' do
      cart = Cart.build_cart('SR1,SR1,GR1,GR1,SR1', true)

      it 'Has valid totals' do
        expect(cart.total_price).to eq 16.61
      end
    end
  end
end

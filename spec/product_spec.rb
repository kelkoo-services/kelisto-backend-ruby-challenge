require_relative '../src/product'

describe Product do
  it "Finds valid product" do
    product = Product.find 'GR1'

    expect(product.code).to eq 'GR1'
    expect(product.price).to eq 3.11
  end

  it 'Fails with invalid product' do
    expect { Product.find('KK1') }.to raise_error(Product::InvalidCodeError)
  end
end

## About your solution

## Configuration

Available products and discounts are configured on yml files inside *data* folder.

There's a Data class (lib/data.rb) that will help loading these files, it will load and parse yml files to return products & discounts when needed.

## Cart

Cart object receives discounts_rules on init, and then we can add products using `cart.scan 'XXX'` or `cart.add_product Product.find('XXXX')`

Both of them will add CartItem objects (on a hash by code, for easier/faster access) which holds product data & quantity for each product, and calcs total_price for that product type

## Discounts

I've build a generic base class Discount which will be inherited by all specific discount types (BulkLowerPrice, BuyXPayY, ...)

This base class has a Discount.build(config) method to create a specific Discounts::XYZType (subclass) based on config params (check data/discounts.yml for examples)

All of the subclasses will use config keys to initialize required attributes (each discount type may require different config) and all of them implement their own apply_on(cart) method, which will check if discount is applicable (based on conditions and current items in cart) and calculate the discount amount (when applicable)

I've created a Discounts::Manager as a service class, to help controlling all discounts logic (and avoid adding all that logic inside Cart class). It'll receive current Cart and discount rules, and will iterate over all of them to create specific Discounts::XXXXType clases and check if they're applicable.

## Notes

* All of CartItem, Discount, Discounts::Manager and Cart implements the to_s method so we can easily print them like a receipt
* I've used a MassInitialize module helper which I've used on some classes to initialize attributes with a {attr: value, ...} hash (similar to ActiveRecord) instead of multiple ordered params
* The discounts logic can be extended a lot, more discounts types, checks to avoid multiple discounts on same product, checks to apply only the best discount if multiple apply, ... but there's no time for all that stuff
* I wanted separate data files (yml) for testing, so we can change/configure products & discounts without breaking the tests. Now Data.load_file checks for ENV['RACK_ENV'] which is initialized in the spec_helper file

## Run the program

It uses ruby-3.1, and also bundler to install rspec

```
bundle install --binstubs
# run tests
bin/rspec
# enter interactive mode
irb -r ./src/cart.rb
```

### or use docker

```
> docker build -t kelisto .
> # start interactive irb to create/play with cart
> docker -it kelisto run
> # run rspec tests
> docker run -it kelisto bin/rspec
```

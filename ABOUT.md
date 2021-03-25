# :Shopping Cart: Kelisto Cart :Shopping Cart:

Backend Ruby Challenge

created by : **Heyling Marquez**.

## Requirements

```bash
$ npm install
$ npm init
$ npx jasmine init
```

## How was it done!? :Flexed Bicep:

In the `src` folder we can find three files, in which:

**1. `checkout.js`

This class contains the logic to scan the items, add the coupons (if any) and calculate the total of the products. 

**2. `items.js` 

This file will be used as a database where we can add as many items as we want and if any coupon is applied. 
The object will be composed by itemCode, name, name, price, coupon.

**3. `pricing-rules.js` 

This file will contain the logic for pricing rules:

- buy one get one free: with the purchase of one product you get the other one free, the offer does not accumulate.

- buy three get ten off: with the purchase of three or more units you get a 10% discount on the price of each unit. 

 Here we can add the pricing rules that are requested. 



### Unit Tests 

The unit tests can be found in the spec folder in the testSpec.js file and to run them perform the following steps.

```bash
$ npx jasmine init 
$ jasmine
```

The unit tests were made with Jasmin and in these we can test 

- Adds an item to the list.
- Increments the item number on duplicated addition.
- Applies the buy_one_get_one_free coupon.
- Applies the buy_three_get_ten_off coupon.
- Scan multiple items and apply the coupons to the appropriate ones. (These tests correspond to the examples in the Challenge.)
 

And...**_That's all Folks._**

**_thanks for the opportunity ._** 

## Author ✒️

* **Heyling Marquez** 

### Built with :heart:

Enjoy it! Happy working💙

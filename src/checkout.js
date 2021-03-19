const pricingRules = require('./pricing_rules.js')
const discounts = require('./discounts.js');

class Checkout {
  constructor() {
    this.rules = JSON.parse(JSON.stringify(pricingRules)); // deep copy
    this.itemList = {};
    this.total = 0.00;
  }

  scan(itemCode) {
    if (!pricingRules[itemCode]) throw new Error('Item code must be in pricing rules');
    if (this.itemList[itemCode]) this.itemList[itemCode]++;
    else this.itemList[itemCode] = 1;
    this.addToTotal(itemCode);
  }

  addToTotal(code) {
    this.total += +discounts.apply(this.rules[code], this.itemList[code]).toFixed(2);
  };

  clear() {
    this.rules = JSON.parse(JSON.stringify(pricingRules)); // deep copy
    this.itemList = {};
    this.total = 0.00;
  }
}

module.exports = Checkout;

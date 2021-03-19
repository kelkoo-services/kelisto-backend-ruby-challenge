const assert = require('assert');
const Checkout = require('../src/checkout.js');
const helpers = require('./helpers.js')

describe('Checkout adds totals with discounts with unordered scan', () => {

  const checkout = new Checkout();
  beforeEach(() => checkout.clear());

  it('should return expected total', () => {
    helpers.scan(['GR1', 'SR1', 'GR1', 'GR1', 'CF1'], checkout);
    assert.strictEqual(checkout.total, 22.45);
  });

  it('should return expected total', () => {
    helpers.scan(['SR1', 'SR1', 'GR1', 'SR1'], checkout);
    assert.strictEqual(checkout.total, 16.61);
  })

  it('should apply all the discounts on a shuffled checkout', () => {
    helpers.scan(['SR1', 'GR1', 'SG1', 'CF1', 'SR1', 'GR1', 'SG1', 'SR1', 'GR1', 'SG1', 'SR1', 'SG1', 'SR1', 'SG1', 'SR1'], checkout);
    assert.strictEqual(checkout.total, 47.75);
  })
});

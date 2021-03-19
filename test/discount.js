const assert = require('assert');
const Checkout = require('../src/checkout.js');
const helpers = require('./helpers.js')

describe('setTotal applies discounts', () => {

  const checkout = new Checkout();
  beforeEach(() => checkout.clear());

  describe('on GR1', () => {
    it('should apply buy-one-get-one-free', () => {
      helpers.scan(Array(2).fill('GR1'), checkout);
      assert.strictEqual(checkout.total, 3.11);
    });
  });

  describe('on SR1', () => {
    it('should apply item count discount when there are 3', () => {
      helpers.scan(Array(3).fill('SR1'), checkout);
      assert.strictEqual(checkout.total, 13.50);
    });

    it('should apply item count discount when there are more than 3', () => {
      helpers.scan(Array(4).fill('SR1'), checkout);
      assert.strictEqual(checkout.total, 18.00);
    });

    it('should not apply item count discount when there are less than 3', () => {
      helpers.scan(Array(2).fill('SR1'), checkout);
      assert.strictEqual(checkout.total, 10.00);
    });
  });

  describe('on CF1', () => {
    it('should always add full price', () => {
      helpers.scan(Array(3).fill('CF1'), checkout);
      assert.strictEqual(checkout.total, 11.23 * 3);
    });
  });

  describe('on SG1', () => {
    it('should only apply buy-one-get-one-free when there are less than 5', () => {
      helpers.scan(Array(3).fill('SG1'), checkout);
      assert.strictEqual(checkout.total, 6.00);
    });

    it('should apply both buy-one-get-one-free and count discount when there are 5', () => {
      helpers.scan(Array(5).fill('SG1'), checkout);
      assert.strictEqual(checkout.total, 3.30);
    });

    it('should apply both buy-one-get-one-free and count discount when there are more than 5', () => {
      helpers.scan(Array(7).fill('SG1'), checkout);
      assert.strictEqual(checkout.total, 4.40);
    });
  })
});

const Checkout = require('../src/checkout');
const pricingRules = require('../src/pricing-rules');


describe("A suite", function () {

    it("adds an item to the list", function () {

        const co = new Checkout(pricingRules);
        const test_item = { itemCode: "GR1", name: "Green tea", price: 3.11, total: 3.11, quantity: 1 };

        co.scan(test_item);

        expect(co.itemList.length).toBe(1);
        expect(co.itemList[0].total).toBe(3.11);
        expect(co.itemList).toEqual([{ itemCode: "GR1", name: "Green tea", price: 3.11, total: 3.11, quantity: 1 }]);

    });

    it("increments the item number on duplicated addition", function () {

        const co = new Checkout(pricingRules);
        const test_item = { itemCode: "GR1", name: "Green tea", price: 3.11, total: 3.11, quantity: 1 };

        co.scan(test_item);
        co.scan(test_item);

        expect(co.itemList.length).toBe(1);
        expect(co.itemList[0].total).toEqual(6.22);
        expect(co.itemList).toEqual([{ itemCode: "GR1", name: "Green tea", price: 3.11, total: 6.22, quantity: 2 }]);

    });

    it("applies the buy_one_get_one_free coupon", function () {

        const co = new Checkout(pricingRules);
        const test_item = { itemCode: "GR1", name: "Green tea", coupon: "buy_one_get_one_free", price: 3.11, total: 3.11, quantity: 1 };

        // 2 ITEMS
        co.scan(test_item);
        co.scan(test_item);

        expect(co.itemList.length).toBe(1);
        expect(co.itemList[0].total).toEqual(3.11);
        expect(co.itemList).toEqual([{ itemCode: "GR1", name: "Green tea", coupon: "buy_one_get_one_free", price: 3.11, total: 3.11, quantity: 2 }]);

        // 3 ITEMS
        co.scan(test_item);

        expect(co.itemList.length).toBe(1);
        expect(co.itemList[0].total).toEqual(6.22);
        expect(co.itemList).toEqual([{ itemCode: "GR1", name: "Green tea", coupon: "buy_one_get_one_free", price: 3.11, total: 6.22, quantity: 3 }]);

    });


    it("applies the buy_three_get_ten_off coupon", function () {

        const co = new Checkout(pricingRules);
        const test_item = { itemCode: "SR1", name: "Strawberry", coupon: "buy_three_get_ten_off", price: 5.00, total: 3.11, quantity: 1 };

        // 2 ITEMS (should not be applied)
        co.scan(test_item);
        co.scan(test_item);

        expect(co.itemList.length).toBe(1);
        expect(co.itemList[0].total).toEqual(10);
        expect(co.itemList).toEqual([{ itemCode: "SR1", name: "Strawberry", coupon: "buy_three_get_ten_off", price: 5.00, total: 10, quantity: 2 }]);

        // 3 ITEMS
        co.scan(test_item);

        expect(co.itemList.length).toBe(1);
        expect(co.itemList[0].total).toEqual(4.50 * 3);
        expect(co.itemList).toEqual([{ itemCode: "SR1", name: "Strawberry", coupon: "buy_three_get_ten_off", price: 5.00, total: 13.50, quantity: 3 }]);

        // MORA THAN 3 ITEMS
        co.scan(test_item);
        co.scan(test_item);

        expect(co.itemList.length).toBe(1);
        expect(co.itemList[0].total).toEqual(22.50);
        expect(co.itemList).toEqual([{ itemCode: "SR1", name: "Strawberry", coupon: "buy_three_get_ten_off", price: 5.00, total: 22.50, quantity: 5 }]);

    });

    /*
    TEST DATA
    Basket: GR1,SR1,GR1,GR1,CF1
    Total price expected: £22.45
    */
    it("calculate total the products ", function () {

        const co = new Checkout(pricingRules);
        const SR1 = { itemCode: "SR1", name: "Strawberry", coupon: "buy_three_get_ten_off", price: 5.00, quantity: 1 };
        const GR1 = { itemCode: "GR1", name: "Green tea", coupon: "buy_one_get_one_free", price: 3.11, quantity: 1 };
        const CF1 = { itemCode: "CF1", name: "Coffe", price: 11.23, quantity: 1 };

        co.scan(GR1);
        co.scan(SR1);
        co.scan(GR1);
        co.scan(GR1);
        co.scan(CF1);

        expect(co.itemList.length).toBe(3);
        expect(co.total).toEqual(22.45);
    });

    /*
    TEST DATA
    Basket: GR1, GR1
    Total price expected: £3.11
    */

    it("Applies the cupon off ", function () {

        const co = new Checkout(pricingRules);
        const GR1 = { itemCode: "GR1", name: "Green tea", coupon: "buy_one_get_one_free", price: 3.11, quantity: 1 };

        co.scan(GR1);
        co.scan(GR1);

        expect(co.itemList.length).toBe(1);
        expect(co.total).toEqual(3.11);
    });

    /*
    TEST DATA
    Basket: SR1, SR1, GR1, SR1
    Total price expected: £16.61
    */

    it("Applies the cupon off ", function () {

        const co = new Checkout(pricingRules);
        const GR1 = { itemCode: "GR1", name: "Green tea", coupon: "buy_one_get_one_free", price: 3.11, quantity: 1 };
        const SR1 = { itemCode: "SR1", name: "Strawberry", coupon: "buy_three_get_ten_off", price: 5.00, quantity: 1 };

        co.scan(SR1);
        co.scan(SR1);
        co.scan(GR1);
        co.scan(SR1);

        expect(co.itemList.length).toBe(2);
        expect(co.total).toEqual(16.61);
    });
});


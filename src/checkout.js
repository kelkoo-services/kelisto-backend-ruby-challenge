const pricingRules = require('./pricing-rules')
const items = require('./items')

class Checkout {

    constructor() {

        this.pricingRules = pricingRules;
        this.items = items;
        this.itemList = [];
        this.total = 0;
    }
    // { itemCode: "GR1", name: "Green tea", price: 3.11, total: 0, quantity: 1 },
    scan(item) {

        const duplicated_item = this.itemList.filter(element => element.itemCode == item.itemCode);

        if (duplicated_item.length == 1) {

            let element = this.itemList.find(elm => elm.itemCode == item.itemCode);
            element.quantity++;
            element.total = this.calculate_coupons(element);
        }
        else {

            item.total = this.calculate_coupons(item);
            this.itemList.push(item);
        }

        this.calculate_total();
    }

    calculate_coupons(item) {

        return Number((item.coupon ? this.pricingRules[item.coupon](item) : (item.price * item.quantity)).toFixed(2));
    }

    calculate_total() {

        let total = 0;

        this.itemList.forEach(function (item) {
            total += item.total;
        })

        this.total = total;
    }
}

module.exports = Checkout;
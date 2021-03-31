"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Checkout = void 0;
var Checkout = /** @class */ (function () {
    function Checkout(currentPricingRules) {
        this._cart = [];
        this._currentPricingRules = currentPricingRules;
    }
    Object.defineProperty(Checkout.prototype, "cart", {
        get: function () {
            return this._cart;
        },
        set: function (cart) {
            this._cart = cart;
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(Checkout.prototype, "currentPricingRules", {
        get: function () {
            return this._currentPricingRules;
        },
        set: function (currentPricingRules) {
            this._currentPricingRules = currentPricingRules;
        },
        enumerable: false,
        configurable: true
    });
    Checkout.prototype.scan = function (product) {
        this.cart.push(product);
    };
    Checkout.prototype.total = function () {
        var sum = 0;
        for (var i in this.cart) {
            sum = sum + this.cart[i].price;
        }
        for (var j in this.currentPricingRules) {
            switch (this.currentPricingRules[j].code) {
                case ("pR0"): {
                    var numberGR1 = 0;
                    for (var i in this.cart) {
                        if (this.cart[i].code == "GR1") {
                            numberGR1++;
                        }
                    }
                    var discount = (Math.floor(numberGR1 / 2) * 3.11);
                    sum = sum - discount;
                    break;
                }
                case "pR1": {
                    var numberSR1 = 0;
                    for (var i in this.cart) {
                        if (this.cart[i].code == "SR1") {
                            numberSR1++;
                        }
                    }
                    if (numberSR1 > 2) {
                        var discount = numberSR1 * 0.50;
                        sum = sum - discount;
                    }
                    break;
                }
            }
        }
        return sum;
    };
    return Checkout;
}());
exports.Checkout = Checkout;

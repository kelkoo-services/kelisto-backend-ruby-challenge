"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PricingRules = void 0;
var PricingRules = /** @class */ (function () {
    function PricingRules(code, named, description, codeProduct1) {
        this._code = code;
        this._named = named;
        this._description = description;
        this._codeProduct1 = codeProduct1;
    }
    Object.defineProperty(PricingRules.prototype, "code", {
        get: function () {
            return this._code;
        },
        set: function (code) {
            this._code = code;
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(PricingRules.prototype, "named", {
        get: function () {
            return this._named;
        },
        set: function (named) {
            this._named = named;
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(PricingRules.prototype, "description", {
        get: function () {
            return this._description;
        },
        set: function (description) {
            this._description = description;
        },
        enumerable: false,
        configurable: true
    });
    return PricingRules;
}());
exports.PricingRules = PricingRules;
//ESCALATING
/* You could escalate here by defining different types of discounts, maybe adding attributes. For instance, you could have the "Product1_buyed_Product2_free", a sale offer that lets you get x units form the product P2 for free when you buy one or more units of product P1.

Another one "Product1+Product2", you get a discount if you buy two products together.

That's the reason I'm using a codeProduct1 atribute; that way it would be easy to add new attributes (e.g. codeProduct2) making sense.

*/ 

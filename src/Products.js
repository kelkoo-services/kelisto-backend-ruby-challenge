"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Products = void 0;
var Products = /** @class */ (function () {
    function Products(code, named, price) {
        this._code = code;
        this._named = named;
        this._price = price;
    }
    Object.defineProperty(Products.prototype, "code", {
        get: function () {
            return this._code;
        },
        set: function (code) {
            this._code = code;
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(Products.prototype, "named", {
        get: function () {
            return this._named;
        },
        set: function (named) {
            this._named = named;
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(Products.prototype, "price", {
        get: function () {
            return this._price;
        },
        set: function (price) {
            this._price = price;
        },
        enumerable: false,
        configurable: true
    });
    return Products;
}());
exports.Products = Products;

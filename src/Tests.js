"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Tests = void 0;
var Tests = /** @class */ (function () {
    function Tests(testProductList, expectedTotal) {
        this._testProductList = testProductList;
        this._expectedTotal = expectedTotal;
    }
    Object.defineProperty(Tests.prototype, "testProductList", {
        get: function () {
            return this._testProductList;
        },
        set: function (testProductList) {
            this._testProductList = testProductList;
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(Tests.prototype, "expectedTotal", {
        get: function () {
            return this._expectedTotal;
        },
        set: function (expectedTotal) {
            this._expectedTotal = expectedTotal;
        },
        enumerable: false,
        configurable: true
    });
    return Tests;
}());
exports.Tests = Tests;

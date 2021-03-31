"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var PricingRules_1 = require("./PricingRules");
var Products_1 = require("./Products");
var Checkout_1 = require("./Checkout");
var Tests_1 = require("./Tests");
//Create pricing rules (we simulate the necessary connection with a current pricing rules' database)
var pR0_GR1_3_2021 = new PricingRules_1.PricingRules("pR0", "buy one-get one free-GR1", "Buy-one-get-one-free offers of green tea", "GR1");
var pR1_SR1_3_2021 = new PricingRules_1.PricingRules("pR1", "discount 3 or more -SR1", "If you buy 3 or more strawberries, the price should drop to £4.50.", "SR1");
//Create products (we simulate the necessary connection with a product database)
var gR1 = new Products_1.Products("GR1", "Green tea", 3.11);
var sR1 = new Products_1.Products("SR1", "Strawberries", 5);
var cF1 = new Products_1.Products("CF1", "Coffee", 11.23);
//Provided tests
var test1 = new Tests_1.Tests([gR1, sR1, gR1, gR1, cF1], 22.45);
var test2 = new Tests_1.Tests([gR1, gR1], 3.11);
var test3 = new Tests_1.Tests([sR1, sR1, gR1, sR1], 16.61);
//Extra tests
var test4 = new Tests_1.Tests([], 0);
var test5 = new Tests_1.Tests([sR1, gR1, sR1, sR1, gR1], 16.61); //both pricing rules applied
var listTests = [test1, test2, test3, test4, test5];
for (var j in listTests) {
    var co = new Checkout_1.Checkout([pR0_GR1_3_2021, pR1_SR1_3_2021]);
    for (var i in listTests[j].testProductList) {
        co.scan(listTests[j].testProductList[i]);
    }
    console.log();
    console.log("****    TEST " + (parseInt(j) + 1) + "     ****");
    console.log("The checkout total is " + co.total() + "£ and the test result for test " + (parseInt(j) + 1) + " is " + (co.total() == listTests[j].expectedTotal));
}

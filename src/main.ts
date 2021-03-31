import {PricingRules} from "./PricingRules";
import {Products} from "./Products";
import {Checkout} from "./Checkout";
import {Tests} from "./Tests";


//Create pricing rules (we simulate the necessary connection with a current pricing rules' database)
let pR0_GR1_3_2021= new PricingRules("pR0", "buy one-get one free-GR1", "Buy-one-get-one-free offers of green tea", "GR1" );
let pR1_SR1_3_2021= new PricingRules("pR1", "discount 3 or more -SR1", "If you buy 3 or more strawberries, the price should drop to £4.50.", "SR1" );

//Create products (we simulate the necessary connection with a product database)
let gR1 = new Products("GR1","Green tea", 3.11 );
let sR1 = new Products("SR1", "Strawberries", 5);
let cF1 = new Products("CF1", "Coffee", 11.23);

//Provided tests
let test1:Tests = new Tests ([gR1, sR1, gR1, gR1, cF1],22.45);
let test2:Tests = new Tests ([gR1, gR1],3.11);
let test3:Tests = new Tests ([sR1, sR1, gR1, sR1],16.61);
//Extra tests
let test4:Tests = new Tests ([], 0);
let test5:Tests = new Tests ([sR1, gR1, sR1, sR1, gR1], 16.61); //both pricing rules applied

let listTests:Tests[]=[test1, test2, test3, test4, test5];


for (let j in listTests){
    const co = new Checkout([pR0_GR1_3_2021,pR1_SR1_3_2021]);
    for (let i in listTests[j].testProductList){
        co.scan(listTests[j].testProductList[i]);
    }
    console.log();
    console.log("****    TEST " + (parseInt(j)+1) + "     ****" );
    console.log("The checkout total is " + co.total() + "£ and the test result for test " + (parseInt(j)+1) + " is " + (co.total()== listTests[j].expectedTotal));
}




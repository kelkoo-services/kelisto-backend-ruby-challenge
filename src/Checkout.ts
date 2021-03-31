import {Products} from "./Products";
import {PricingRules} from "./PricingRules";

export class Checkout{
    private _cart:Products[];
    private _currentPricingRules:PricingRules[];

constructor (currentPricingRules:PricingRules[]){
    this._cart = [];
    this._currentPricingRules = currentPricingRules;
}

public get cart():Products[]{
    return this._cart;
}
public get currentPricingRules():PricingRules[]{
    return this._currentPricingRules;
}
public set cart(cart:Products[]){
    this._cart=cart;
}
public set currentPricingRules(currentPricingRules:PricingRules[]){
    this._currentPricingRules = currentPricingRules;
}

public scan(product:Products){ //fills the cart
    this.cart.push(product);
}

public total():number{ //Sums all the prices and applies current pricing rules
    let sum:number=0;
    for (let i in this.cart){
        sum=sum + this.cart[i].price;     
    }
    for (let j in this.currentPricingRules){
        switch (this.currentPricingRules[j].code){
            case ("pR0"):{
                    let numberGR1:number=0;
                    for (let i in this.cart){
                        if (this.cart[i].code == "GR1"){
                            numberGR1++;
                        }
                    }
                    let discount:number= (Math.floor(numberGR1/2)*3.11);
                    sum=sum-discount;
             break;   
            }        
            case "pR1":{
                    let numberSR1:number=0;
                    for (let i in this.cart){
                        if (this.cart[i].code == "SR1"){
                            numberSR1++;
                        }
                    }
                if (numberSR1>2){
                    let discount:number= numberSR1*0.50;
                    sum=sum-discount;
               }
               break;
            }
        }
    }
    return sum;
}
}
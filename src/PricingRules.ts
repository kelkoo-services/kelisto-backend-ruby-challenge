export class PricingRules {
   private _code: string;
   private _named: string;
   private _description: string;
   private _codeProduct1: string;  //code of the product which bears the discount. See ESCALATING comments.
   
constructor (code:string, named:string, description:string, codeProduct1:string){
    this._code=code;
    this._named=named;
    this._description=description;
    this._codeProduct1=codeProduct1;
}

public set code(code:string){
    this._code=code;
}
public set named(named:string){
    this._named=named;
}
public set description(description:string){
    this._description=description;
}
public get code():string{
    return this._code;
}
public get named():string{
    return this._named;
}
public get description():string{
    return this._description;
}
}

//ESCALATING

/* You could escalate here by defining different types of discounts, maybe adding attributes. For instance, you could have the "Product1_buyed_Product2_free", a sale offer that lets you get x units form the product P2 for free when you buy one or more units of product P1.

Another one "Product1+Product2", you get a discount if you buy two products together.

That's the reason I'm using a codeProduct1 atribute; that way it would be easy to add new attributes (e.g. codeProduct2) making sense.

*/
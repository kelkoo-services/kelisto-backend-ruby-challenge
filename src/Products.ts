export class Products{
   private _code: string;
   private _named: string;
   private _price: number;

constructor(code:string, named:string, price:number ){
    this._code=code;
    this._named=named;
    this._price=price;
}

get code():string{
    return this._code;
}
get named():string{
    return this._named;
}
get price():number{
    return this._price;
}
set code(code:string){
    this._code=code;
}
set named(named:string){
    this._named=named;
}
set price(price:number){
    this._price=price;
}
}
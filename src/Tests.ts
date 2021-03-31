import {Products} from "./Products";

export class Tests{
    private _testProductList:Products[];
    private _expectedTotal:number;


constructor (testProductList:Products[], expectedTotal:number){
    this._testProductList = testProductList;
    this._expectedTotal = expectedTotal;
}

get testProductList():Products[]{
    return this._testProductList;
}
get expectedTotal():number{
    return this._expectedTotal;
}
set testProductList(testProductList:Products[]){
    this._testProductList=testProductList;
}
set expectedTotal(expectedTotal:number){
    this._expectedTotal=expectedTotal;
}

}
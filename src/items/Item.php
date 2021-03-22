<?php

class Item {
    protected $itemCode;
    protected $itemName;
    protected $itemPrice;
    protected $itemOneFree;

    public function __construct($code, $name, $price, $oneFree = null)
    {
        $this->itemCode = $code;
        $this->itemName = $name;
        $this->itemPrice = $price;
        $this->itemOneFree = $oneFree;
    }

    public function getItemCode() {
        return $this->itemCode;
    }

    public function getItemName() {
        return $this->itemName;
    }

    public function getItemPrice() {
        return $this->itemPrice;
    }

    public function setItemPrice($price){
        $this->itemPrice = $price;
    }

    public function getItemOnefree(){
        return $this->itemOneFree;
    }

}
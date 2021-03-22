<?php 
require_once './items/Item.php';

class CheckoutModel {

    protected $greenTea;
    protected $strawberry;
    protected $coffe;

    public function getItems(){
        $this->greenTea = new Item('GR1', 'Green Tea', 3.11, true);
        $this->strawberry = new Item('SR1', 'Strawberry', 5.00);
        $this->coffee = new Item('CF1', 'Coffee', 11.23);

        $catalogue = [$this->greenTea, $this->strawberry, $this->coffee];
        
        return $catalogue;
    }

    public function getTotal($basket){

        $items = $this->getItems();
        $totalRelative=[];
        $total = 0;
        // Set the item with the price dropping discount
        $discountCode = 'SR1';


        foreach($items as $item){
            $totalRelative[$item->getItemCode()] = 0;
        }
        
        foreach($items as $item){
            $cont = 0;

            for($i = 0; $i<count($basket); $i++){

                if($item->getItemCode() == $basket[$i]){

                    // Price drop offer
                    if($item->getItemCode() == $discountCode && $cont<1){
                        $code = $item->getItemCode();
                        $oldPrice = $item->getItemPrice();
                        $priceDrop = $this->lowerPrice($code, $basket);
                        $newPrice = $oldPrice - $priceDrop;
                        $item->setItemPrice($newPrice);

                        if($oldPrice != $newPrice){
                            $cont++;
                        }
                    }

                    // buy-one-get-one-free offer applies to the one with the flag set to 'true'
                    if($item->getItemOneFree() == true){
                        if (($i % 2) == 0){
                            $totalRelative[$basket[$i]] += $item->getItemPrice();
                        }
                    } else {
                        $totalRelative[$basket[$i]] += $item->getItemPrice();
                    }
                }
            }
        }
        
        foreach($totalRelative as $total2){
            $total += $total2;
        }

        return $total;
    }
    
    public function lowerPrice($code, $basket){
        $priceDrop = 0.50;
        $cont = 0;
        for($i = 0; $i < count($basket); $i++){
            if($basket[$i] == $code){
                $cont++;
            }

            if($cont >= 3){
                return $priceDrop;
            }
        }

        return 0;
    }
}
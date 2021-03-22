<?php
require_once './models/CheckoutModel.php';

class CheckoutController {

    public function index(){
        $products = new CheckoutModel();
        $items = $products->getItems();

        // Call the view
        require_once './views/checkoutView.php';
    }
}


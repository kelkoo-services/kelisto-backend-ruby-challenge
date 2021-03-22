<?php

require './models/CheckoutModel.php';
require './controllers/CheckoutController.php';

$basketString = file_get_contents('php://input');

$basketArray = explode(",", $basketString); 

$basket = new CheckoutModel();

$price = $basket->getTotal($basketArray);

echo " £".$price;
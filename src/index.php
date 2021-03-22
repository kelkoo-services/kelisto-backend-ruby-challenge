<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="./bootstrap-4.5.2-dist/css/bootstrap.min.css">

        <link rel="stylesheet" href="./assets/styles.css">
        <title>Backend Challege</title>
    </head>

    <body>

        <?php
            require_once './controllers/CheckoutController.php';

            $co = new CheckoutController();

            $co->index();
        ?> 

 

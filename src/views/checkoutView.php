
    <h1 id="title" class="d-flex justify-content-center mt-5">CHECKOUT SYSTEM</h1>

    <div class="container d-flex justify-content-center mt-5">
        <div class="items-container col-md-11">
            <?php foreach ($items as $item) : ?>
                <div class="d-flex justify-content-center" >

                    <?php
                         $name = $item->getItemName();
                         $code = $item->getItemCode();
                         $price = $item->getItemPrice();
                         $oneFree = $item->getItemOneFree();

                         $array[] = $item->getItemCode();
                    ?>
                    
                    
                    <button onclick="scanItem('<?= $code ?>', '<?= $name ?>', '<?= $price ?>', '<?= $oneFree ?>')" class="item_button m-2 btn btn-light">
                        <p id="itemName">
                            <?= $item->getItemName(); ?>
                        </p>
                    </button>


                    <input type="" class="amount" id="<?= $code ?>" class="d-flex justify-content-center m-1 amount" value="0" readonly></input>

                    
                </div>
            <?php endforeach; ?>
        </div>

    </div>

    <?php 
        $arrayString = implode(",", $array);
    ?>

    <div class="d-flex justify-content-center mt-2">
        <button class="btn btn-light border" id="checkout" onclick="checkout('<?= $arrayString; ?>')">CHECKOUT</button>
    </div>      

    <div class="d-flex justify-content-center mt-2">
        <button class="btn btn-danger border" id="reset" onclick="reset()">RESET</button>
    </div>                

    <div class="d-flex justify-content-center">
        <div id="total" class="total d-flex justify-content-center mt-5 border col-md-4">
            TOTAL PRICE: 
                <p id="response" class="ml-1"></p>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="bootstrap-4.5.2-dist/js/bootstrap.min.js"></script>

    <script src="./assets/js/main.js"></script>


</body>

</html>


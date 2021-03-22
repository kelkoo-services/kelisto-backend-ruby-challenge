
function scanItem(code, name, price, oneFree){
   
    var item = {
        'code': code,
        'name': name,
        'price': price,
        'oneFree': oneFree
    } 

    let cantidad = document.getElementById(item.code).value;
    
    cantidad++;

    document.getElementById(item.code).value = cantidad;
}


function checkout(array){

    let codesCatalogue = array.split(',');
    let codesAmount = new Array;
    let amounts = new Array;

    for(let i = 0; i < codesCatalogue.length; i++){
        amounts[i] = document.getElementById(codesCatalogue[i]).value;
    }

    for(let x = 0; x < amounts.length; x++){
        for(let y = 0; y < amounts[x]; y++){
            codesAmount.push(codesCatalogue[x]);
        }
    }

    //AJAX CALL
    var xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function(){
        if (xhr.readyState == 4 && xhr.status == 200) {
            document.getElementById('response').innerHTML = xhr.responseText;
        }
    };

    xhr.open("POST", "basket.php", true);
    xhr.send(codesAmount);
}

function reset(){
    window.location.href = window.location.href
}






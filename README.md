# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
 // if (!(document.getElementById("item-price") != null)) {
  if ( document.URL.match("/items") || (!(document.getElementById("item-price") != null))) {
  
    function calculation (){
      const price  = document.getElementById("item-price");
      price.addEventListener("keyup", () => {
        const val = price.value
        const add = val / 10
        const profit_price = val - add
        
  
        // カンマ表示の実験
        var num = add;
        var after = String(num).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,' );
        console.log(after);
        // カンマ表示の実験
  
  
        const Taxval  = document.getElementById("add-tax-price");
        Taxval.innerHTML = Math.floor(add);
        const profit_calculation  = document.getElementById("profit");
        profit_calculation.innerHTML = Math.floor(profit_price);
      });
    }
    window.addEventListener('load', calculation);
   }
  // }

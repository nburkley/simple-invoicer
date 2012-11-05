(function() {

  Handlebars.registerHelper("debug", function(optionalValue) {
    console.log("Current Context");
    console.log("====================");
    console.log(this);

    if (optionalValue) {
      console.log("Value");
      console.log("====================");
      console.log(optionalValue);
    }
  });

  Handlebars.registerHelper("formatDate", function(date) {
    var formattedDate = Date.parseExact(date, "yyyy-M-d");
    return formattedDate.toString('yyyy-MMM-dd');
  });

  Handlebars.registerHelper("formatPrice", function(price, currencySymbol) {
    return currencySymbol + parseFloat(price).toFixed(2);
  });

})();
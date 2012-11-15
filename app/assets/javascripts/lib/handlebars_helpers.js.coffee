Handlebars.registerHelper "debug", (optionalValue) ->
  console.log("Current Context")
  console.log("====================")
  console.log(this)

  if optionalValue
    console.log("Value")
    console.log("==================")
    console.log("optionalValue")

Handlebars.registerHelper "formatDate", (date) ->
    formattedDate = Date.parseExact(date, "yyyy-M-d")
    formattedDate.toString('yyyy-MMM-dd')

Handlebars.registerHelper "formatPrice", (price, currencySymbol) ->
  currencySymbol + parseFloat(price).toFixed(2)
  
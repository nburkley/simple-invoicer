# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
jQuery ->
  $('#invoice_date').datepicker
    dateFormat: 'yy-mm-dd'

  $(".invoice-item").each ->
    lineItem = $(this)
    lineItem.find(".quantity").change ->
      updateLineTotal(lineItem)
    lineItem.find(".price").change ->
      updateLineTotal(lineItem)
    updateLineTotal(lineItem)

changeGrandTotal = (amount) ->
  total = parseFloat($('#invoice-total').html())
  total = 0 if isNaN(total)
  total += amount
  $('#invoice-total').html(total.toFixed(2))
  false

updateLineTotal = (lineItem) ->
  quantity = parseFloat(lineItem.find(".quantity").val())
  price = parseFloat(lineItem.find(".price").val())
  lineTotal = lineItem.find(".line-total")
  oldTotal = parseFloat(lineTotal.html())
  if !isNaN(quantity) && !isNaN(price)
    total = quantity*price
    lineTotal.html(total.toFixed(2))
    changeGrandTotal(total-oldTotal)
  false

$(document).on "nested:fieldAdded", (event) ->
  lineItem = event.field
  lineItem.find(".quantity").change ->
    updateLineTotal(lineItem)
  lineItem.find(".price").change ->
    updateLineTotal(lineItem)

SimpleInvoicer.Views.InvoiceItem = Support.CompositeView.extend
  tagName: "tr"
  template: HandlebarsTemplates['invoices/item']

  events:
    "click a.delete-link": "delete"

  initialize: () ->
    _.bindAll(this, "render")

  render: () ->
    @$el.attr("id", "invoice_" + @model.id)
    @$el.html(@template(@model.toJSON()))

  delete: (e) ->
    e.preventDefault()
    confirmed = confirm("Are you sure you delete this invoice?")
    if confirmed
      $(@el).css({'background-color': '#ffcccc'}).fadeOut(400)
      @model.destroy()
    false


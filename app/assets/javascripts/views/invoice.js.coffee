SimpleInvoicer.Views.Invoice = Support.CompositeView.extend
  tagName: 'div'
  id: 'invoice-show'
  template: HandlebarsTemplates['invoices/show']

  initialize: () ->
    _.bindAll(this, "render")

  render: () ->
    @$el.html(@template(@model.toJSON()))
    this
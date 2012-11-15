SimpleInvoicer.Views.InvoicesIndex = Support.CompositeView.extend
  tagName: 'div'
  id: 'invoices'
  template: HandlebarsTemplates['invoices/index']

  initialize: () ->
    _.bindAll(this, "render")
    @collection.bind("remove", @render)
    return

  render: () ->
    @renderTemplate()
    @renderInvoices()
    this

  renderTemplate: () ->
    @$el.html(@template())
    return

  renderInvoices: () ->
    self = this
    @collection.each (invoice) ->
      row = new SimpleInvoicer.Views.InvoiceItem(model: invoice)
      self.renderChild(row)
      self.$('tbody').append(row.el)
    return
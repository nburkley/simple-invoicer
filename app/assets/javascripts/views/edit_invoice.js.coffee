SimpleInvoicer.Views.EditInvoice = Support.CompositeView.extend
  tagName: 'div'
  id: 'invoice-edit'
  template: HandlebarsTemplates['invoices/edit']

  initialize: () ->
    _.bindAll(this, "render")

  render: () ->
    form = new Backbone.Form(model: @model).render()
    @.$el.html(form.el)
    this

SimpleInvoicer.Views.ClientsIndex = Support.CompositeView.extend
  tagName: 'div'
  id: 'clients'
  template: HandlebarsTemplates['clients/index']

  initialize: () ->
    _.bindAll(this, "render")

  render: () ->
    @renderTemplate()
    @renderClients()
    this

  renderTemplate: () ->
    @$el.html(@template())

  renderClients: () ->
    self = this
    @collection.each (client) ->
      row = new SimpleInvoicer.Views.ClientEntry(model: client)
      self.renderChild(row)
      self.$('tbody').append(row.el)

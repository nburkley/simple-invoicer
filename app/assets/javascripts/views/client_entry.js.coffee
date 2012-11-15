SimpleInvoicer.Views.ClientEntry = Support.CompositeView.extend
  tagName: "tr"
  template: HandlebarsTemplates['clients/entry']

  initialize: () ->
    _.bindAll(this, "render")

  render: () ->
    @$el.attr("id, client_" + @model.id)
    @$el.html(@template(@model.toJSON()))

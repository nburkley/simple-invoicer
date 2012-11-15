SimpleInvoicer.Models.Client = Backbone.Model.extend ->
  toString ->
    @get('name')
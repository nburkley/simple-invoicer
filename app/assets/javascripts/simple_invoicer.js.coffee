window.SimpleInvoicer =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: (data) ->
    this.currentUser = new SimpleInvoicer.Models.User(data.currentUser)
    this.invoices = new SimpleInvoicer.Collections.Invoices(data.invoices)
    this.currencyTypes = new SimpleInvoicer.Collections.CurrencyTypes(data.currencyTypes)

    new SimpleInvoicer.Router({collection: this.invoices, currentUser: this.currentUser })
    if !Backbone.history.started
      Backbone.history.start()
      Backbone.history.started = true

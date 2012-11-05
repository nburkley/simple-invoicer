window.SimpleInvoicer =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: (data) ->
    this.invoices = new SimpleInvoicer.Collections.Invoices(data.invoices)
    this.currentUser = new SimpleInvoicer.Collections.Users(data.currentUser)

    new SimpleInvoicer.Router({collection: this.invoices, currentUser: this.currentUser })
    if !Backbone.history.started
      Backbone.history.start()
      Backbone.history.started = true

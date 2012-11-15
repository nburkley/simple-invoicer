SimpleInvoicer.Models.User = Backbone.Model.extend

  initialize: () ->
    # // TODO move this into parse/set
    @clients  = new SimpleInvoicer.Collections.Clients(@get('clients'))
    return

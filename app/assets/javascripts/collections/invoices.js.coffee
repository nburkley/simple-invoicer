SimpleInvoicer.Collections.Invoices = Backbone.Collection.extend
  model: SimpleInvoicer.Models.Invoice
  url: '/api/invoices'
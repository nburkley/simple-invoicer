// will change this to universal router
SimpleInvoicer.Router = Support.SwappingRouter.extend({
  initialize: function(options) {
    this.el = $('#simple-invoicer');
    this.collection  = options.collection;
    this.users = options.users;
  },

  routes: {
    "":                  "invoicesIndex",
    "invoices":          "invoicesIndex",
    "invoices/:id":      "showInvoice",
    "invoices/:id/edit": "editInvoice"
  },
  
  invoicesIndex: function() {
    var view = new SimpleInvoicer.Views.InvoicesIndex({collection: this.collection});
    this.swap(view);
  },

  showInvoice: function(invoiceId) {
    var invoice = this.collection.get(invoiceId);
    var view = new SimpleInvoicer.Views.Invoice({model: invoice});
    this.swap(view);
  },

  editInvoice: function(invoiceId) {
    var invoice = this.collection.get(invoiceId);
    var view = new SimpleInvoicer.Views.EditInvoice({model: invoice});
    this.swap(view);
  }

});
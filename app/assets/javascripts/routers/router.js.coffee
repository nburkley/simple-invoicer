SimpleInvoicer.Router = Support.SwappingRouter.extend

  initialize: (options) ->
    @el = $('#simple-invoicer')
    @collection  = options.collection
    @user = options.user

  routes: {
    "":                   "invoicesIndex",
    "invoices":           "invoicesIndex",
    "invoices/:id":       "showInvoice",
    "invoices/:id/edit":  "editInvoice",
    "clients":            "clientsIndex",
    "profile":            "editProfile"
  }
  
  invoicesIndex: () ->
    view = new SimpleInvoicer.Views.InvoicesIndex(collection: @collection)
    @swap(view)

  showInvoice: (invoiceId) ->
    invoice = @collection.get(invoiceId)
    view = new SimpleInvoicer.Views.Invoice(model: invoice)
    @swap(view)

  editInvoice: (invoiceId) ->
    invoice = @collection.get(invoiceId)
    view = new SimpleInvoicer.Views.EditInvoice(model: invoice)
    @swap(view)
  
  clientsIndex: () ->
    view = new SimpleInvoicer.Views.ClientsIndex(collection: SimpleInvoicer.currentUser.clients)
    @swap(view)

  editProfile: () ->
    view = new SimpleInvoicer.Views.EditProfile()
    @swap(view)

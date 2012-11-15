SimpleInvoicer.Models.Invoice = Backbone.Model.extend

  schema:
    client: 
      type: 'Select' 
      options: (callback)->
        callback(SimpleInvoicer.currentUser.clients)
    number: 'Text'
    date: 'Text'
    currencyType:
      type: 'Select'
      options: (callback) ->
        callback(SimpleInvoicer.currencyTypes)
    note: 'Text'

  urlRoot: '/api/invoices'

  initialize: ->
    @client = @get('client')
    return

  formattedNumber: ->
    number = @get('number').toString()
    number = "0" + number  while number.length < 7
    number

  toJSON: -> 
    json = Backbone.Model.prototype.toJSON.call(this)
    json.formattedNumber = @formattedNumber()
    json

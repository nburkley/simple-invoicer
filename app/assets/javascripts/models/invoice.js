SimpleInvoicer.Models.Invoice = Backbone.Model.extend({

    urlRoot: '/api/invoices',
    initialize: function() {
    },

    formattedNumber:function() {
      var number = this.get('number').toString();
      while (number.length < 7) number = "0" + number;
      return number;
    },

    formattedDate: function() {
      var date = Date.parseExact(this.get('date'), "yyyy-M-d");
      return date.toString('yyyy-MMM-dd');
    },

    formattedTotal: function() {
      var total = parseFloat(this.get('total'));
      var symbol = this.get('currency_type').symbol;
      return symbol + total.toFixed(2);
    },

    toJSON: function() {
      var json = Backbone.Model.prototype.toJSON.call(this);
      json.formattedNumber = this.formattedNumber();
      json.formattedDate = this.formattedDate();
      json.formattedTotal = this.formattedTotal();
      return json;
    }

});
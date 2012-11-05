SimpleInvoicer.Views.InvoicesIndex = Support.CompositeView.extend({
  tagName: 'div',
  id: 'invoices',
  template: HandlebarsTemplates['invoices/index'],

  initialize: function() {
    _.bindAll(this, "render");
    this.collection.bind("remove", this.render);
  },

  render: function() {
    this.renderTemplate();
    this.renderInvoices();
    return this;
  },

  renderTemplate: function() {
    this.$el.html(this.template())
  },
  
  renderInvoices: function() {
    var self = this;
    this.collection.each(function(invoice) {
      var row = new SimpleInvoicer.Views.InvoiceItem({model: invoice});
      self.renderChild(row);
      self.$('tbody').append(row.el);
    });
  }
});

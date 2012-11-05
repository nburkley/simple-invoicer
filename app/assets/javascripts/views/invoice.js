SimpleInvoicer.Views.Invoice = Support.CompositeView.extend({
  tagName: 'div',
  id: 'invoice-show',
  template: HandlebarsTemplates['invoices/show'],

  initialize: function() {
    _.bindAll(this, "render");
  },

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }

});
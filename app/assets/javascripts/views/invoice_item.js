SimpleInvoicer.Views.InvoiceItem = Support.CompositeView.extend({
  tagName: "tr",
  template: HandlebarsTemplates['invoices/item'],

  events: {
    "click a.delete-link": "delete"
  },

  initialize: function() {
    _.bindAll(this, "render");
  },
  
  render: function() {
    this.$el.attr("id", "invoice_" + this.model.id);
    this.$el.html(this.template(this.model.toJSON()));
  },
  
  delete: function(e) {
    e.preventDefault();
    var confirmed = confirm("Are you sure you delete this invoice?");
    if (confirmed) {
      $(this.el).css({'background-color': '#ffcccc'}).fadeOut(400);
      this.model.destroy();
    }
      return false;
  }

});
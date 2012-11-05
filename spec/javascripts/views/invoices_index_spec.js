//= require application
describe("SimpleInvoicer.Views.InvoicesIndex", function() {
  it("renders an invoice table", function() {
    var invoicesCollection = new SimpleInvoicer.Collections.Invoices();
    invoicesCollection.reset([
      {number: "1"},
      {number: "2"}
    ]);
    var view  = new SimpleInvoicer.Views.InvoicesIndex({collection: invoicesCollection});
    view.render();

    expect(view.$el).toBe("#invoices");
    expect(view.$el).toContain("table");
  });

  it("renders a collection of invoices", function() {
     var invoicesCollection = new SimpleInvoicer.Collections.Invoices();
     invoicesCollection.reset([
        {number: "cat"},
        {number: "dog"}
     ]);
     var view  = new SimpleInvoicer.Views.InvoicesIndex({collection: invoicesCollection});
     var $el = $(view.render().el);
       
     expect($el).toHaveText(/cat/);
     expect($el).toHaveText(/dog/);
  
  });

});

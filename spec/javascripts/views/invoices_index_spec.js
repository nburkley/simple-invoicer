//= require application
describe("SimpleInvoicer.Views.InvoicesIndex", function() {
  it("renders an invoice table", function() {
    var invoicesCollection = new SimpleInvoicer.Collections.Invoices();
    invoicesCollection.reset([
      {number: "1", date: "2012-09-24", total: "249.0"},
      {number: "2", date: "2012-12-25", total: "100.0"}
    ]);
    var view  = new SimpleInvoicer.Views.InvoicesIndex({collection: invoicesCollection});
    view.render();

    expect(view.$el).toBe("#invoices");
    expect(view.$el).toContain("table");
  });

  it("renders a collection of invoices", function() {
     var invoicesCollection = new SimpleInvoicer.Collections.Invoices();
     invoicesCollection.reset([
       {number: "1", date: "2012-09-24", total: "249.0", client:{"name":"Acme"} },
       {number: "2", date: "2012-12-25", total: "100.0", client:{"name":"TED"}}
     ]);
     var view  = new SimpleInvoicer.Views.InvoicesIndex({collection: invoicesCollection});
     var $el = $(view.render().el);
       
     expect($el).toHaveText(/Acme/);
     expect($el).toHaveText(/TED/);
  
  });

});

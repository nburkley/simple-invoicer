//= require application

describe("SimpleInvoicer.Collections.Invoices", function() {
  it("contains instances of SimpleInvocer.Models.Invoice", function() {
    var collection = new SimpleInvoicer.Collections.Invoices();
    expect(collection.model).toEqual(SimpleInvoicer.Models.Invoice);
  }),

  it("is peristed at /invoices", function() {
    var collection = new SimpleInvoicer.Collections.Invoices();
    expect(collection.url).toEqual('/api/invoices');
  });
});
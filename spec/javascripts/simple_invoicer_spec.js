describe("SimpleInvoicer", function() {
  it("has a namespace for Models", function() {
    expect(SimpleInvoicer.Models).toBeTruthy();
  });

  it("has a namespace for Collections", function() {
    expect(SimpleInvoicer.Collections).toBeTruthy();
  });

  it("has a namespace for Views", function() {
    expect(SimpleInvoicer.Views).toBeTruthy();
  });

  it("has a namespace for Routers", function() {
    expect(SimpleInvoicer.Routers).toBeTruthy();
  });

  describe("initialize()", function() {
    it("accepts data JSON and instantiates a collection from it", function() {
      var data = {
        "invoices": [{"number":"1", "date":"2012-09-24", "total":"249.0"}, {"number":"2", "date":"2012-12-25", "total":"100.0"}, ],
        "currentUser": [{"id":"1", "email": "example@example.com"}]
      };
      SimpleInvoicer.initialize(data);

      expect(SimpleInvoicer.invoices).not.toEqual(undefined);
      expect(SimpleInvoicer.invoices.length).not.toEqual(undefined);
      expect(SimpleInvoicer.invoices.models[0].get('number')).toEqual("1");
      expect(SimpleInvoicer.invoices.models[1].get('number')).toEqual("2");
      expect(SimpleInvoicer.currentUser).not.toEqual(undefined);
    });

    it("instantiates a router", function() {
      sinon.spy(SimpleInvoicer, 'Router');
      SimpleInvoicer.initialize({});
      expect(SimpleInvoicer.Router).toHaveBeenCalled();
      SimpleInvoicer.Router.restore();
    });

    it("starts Backbone history", function() {
      Backbone.history.started = null;
      Backbone.history.stop();
      sinon.spy(Backbone.history, 'start');
      SimpleInvoicer.initialize({});

      expect(Backbone.history.start).toHaveBeenCalled();

      Backbone.history.start.restore();
    });
  });
});
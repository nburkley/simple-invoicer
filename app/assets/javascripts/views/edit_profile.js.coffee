SimpleInvoicer.Views.EditProfile = Support.CompositeView.extend
  tagName: 'div'
  id: 'profile-edit'
  template: HandlebarsTemplates['profile/edit']

  initialize: () ->
    _.bindAll(this, "render")

  render: () ->
    @$el.html(@template(SimpleInvoicer.currentUser.get('profile')))
    this
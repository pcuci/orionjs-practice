# Navigation: Event Handlers
Template.Navigation.events {
  'click #sign-in-out-button': (event) ->
    event.preventDefault()
    if Meteor.user()
      AccountsTemplates.logout()
    else
      Router.go '/admin/login' + "?ref=%2F"
    return
}

# Navigation: Helpers
Template.Navigation.helpers {
  currentUserState: ->
    key = (if Meteor.userId() then AccountsTemplates.texts.navSignOut else AccountsTemplates.texts.navSignIn)
    T9n.get key, markIfMissing = false
  active: (path) ->
    (if Router.current().url is path then "active" else "")
}

# Navigation: Lifecycle Hooks
Template.Navigation.created = ->

Template.Navigation.rendered = ->
  $(".button-collapse").sideNav
    menuWidth: 300
    edge: "left"
    closeOnClick: true

Template.Navigation.destroyed = ->

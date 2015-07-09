# Navigation: Event Handlers
Template.Navigation.events {
  'click #at-nav-button': (event) ->
    if Meteor.user()
      AccountsTemplates.logout()
    else
      Router.go 'login'
    return
}

# Navigation: Helpers
Template.Navigation.helpers {
  active: (path) ->
    (if Router.current().url is path then "active" else "")
  environment: ->
    if (process and process.env and (process.env.NODE_ENV isnt "production"))
      process.env.NODE_ENV + " v" + if Meteor.settings? and Meteor.settings.public? and Meteor.settings.public.appVersion? then Meteor.settings.public.appVersion else "*.*.*"
  envBackground: ->
    if (process and process.env and (process.env.NODE_ENV isnt "production"))
      switch process.env.NODE_ENV
        when 'test' then "env-test";
        when 'staging' then "env-staging"
        else "env-development"
    else
      ""
}

# Navigation: Lifecycle Hooks
Template.Navigation.created = ->

Template.Navigation.rendered = ->
  $(".button-collapse").sideNav
    menuWidth: 300
    edge: "left"
    closeOnClick: true

Template.Navigation.destroyed = ->

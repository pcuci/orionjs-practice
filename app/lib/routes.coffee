Router.configure
  layoutTemplate: 'MasterLayout'
  loadingTemplate: 'Loading'
  notFoundTemplate: 'NotFound'

Router.onBeforeAction (->
  unless Meteor.user()
    @render "AccessDenied"
  else
    @next()
),
  only: [
  ]

Router.route '/',
  name: 'home'
  controller: 'HomeController'
  action: 'action'
  where: 'client'

Router.route 'topics',
  name: 'topics'
  controller: 'TopicsController'
  action: 'list'
  where: 'client'

Router.route 'topic/new',
  name: 'topicNew'
  controller: 'TopicsController'
  action: 'new'
  where: 'client'

Router.route 'topic/:_id',
  name: 'topicShow'
  controller: 'TopicsController'
  action: 'show'
  where: 'client'

Router.route 'topic/:_id/edit',
  name: 'topicEdit'
  controller: 'TopicsController'
  action: 'edit'
  where: 'client'

@TopicsController = RouteController.extend(
  waitOn: -> [
    Meteor.subscribe("Topics")
  ]
  data: ->
    Topics.findOne _id: @params._id
  list: ->
    @render 'Topics', {}
    return
  new: ->
    @render 'TopicNew', {}
    return
  show: ->
    @render 'TopicShow', {}
    return
  edit: ->
    @render 'TopicEdit', {}
    return
)

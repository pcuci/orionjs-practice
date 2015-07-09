Template.registerHelper "TabularTables", TabularTables

topicHook =
  formToDoc: (doc) ->
    console.log("in topicHook formToDoc")
    doc.created ?= new Date()
    doc.updated = new Date()
    doc.authorId = Meteor.userId()
    doc
  after:
    insert: ->
      Router.go("topics")
    update: ->
      Router.go("topics")

AutoForm.hooks
  topicNewForm: topicHook
  topicEditForm: topicHook

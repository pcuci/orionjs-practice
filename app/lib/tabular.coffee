@TabularTables = {}
TabularTables.TopicsList = new Tabular.Table(
  name: "TopicsList"
  collection: Topics
  columns: [
    data: "name"
    title: "Name"
  ,
    data: "importance"
    title: "Importance"
  ,
    data: "stars"
    title: "Stars"
  ,
    data: "created"
    title: "Created"
    render: (val, type, doc) ->
      if val instanceof Date
        moment(val).calendar()
      else
        "Never"
  ,
    data: "updated"
    title: "Updated"
    render: (val, type, doc) ->
      if val instanceof Date
        moment(val).calendar()
      else
        "Never"
  ,
    data: "authorId"
    title: "AuthorId"
  ,
    data: "_id"
    tmpl: Meteor.isClient and Template.TopicEditCell
  ]
)

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
    data: "feelingGood"
    title: "Good"
  ,
    data: "feelingAnxious"
    title: "Anxious"
  ,
    data: "stars"
    title: "Stars"
  ,
    data: "tags"
    title: "Tags"
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

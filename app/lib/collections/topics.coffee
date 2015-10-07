@Topics = new orion.collection('topics',
  singularName: "topic"
  pluralName: "topics"
  title: "Topics"
  link:
    title: "Topics"
  tabular:
    columns: [
      data: "name"
      title: "Name"
    ,
      orion.attributeColumn("updatedAt", "updated", "Updated")
    ,
      orion.attributeColumn("createdAt", "created", "Created")
    ,
      orion.attributeColumn("createdBy", "authorsId", "Author ID")
    ]
)

Topics.attachSchema new SimpleSchema(
  name:
    type: String
    label: "Name"
  created: orion.attribute('createdAt')
  updated: orion.attribute('updatedAt')
  authorId: orion.attribute('createdBy')
)

if Meteor.isServer
  Topics.allow
    insert: (userId, doc) ->
      true
    update: (userId, doc, fieldNames, modifier) ->
      true
    remove: (userId, doc) ->
      true
  Topics.deny
    insert: (userId, doc) ->
      false
    update: (userId, doc, fieldNames, modifier) ->
      false
    remove: (userId, doc) ->
      false

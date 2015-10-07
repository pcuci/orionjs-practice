@Topics = new Mongo.Collection('topics')

@radioOptions = [
  value: "opt1"
  label: "Bit Good\ndt1 whoaos dt1 whoaos dfa"
,
  value: "opt2"
  label: "Fairly Good"
,
  value: "opt3"
  label: "Betterthanaveragealways\nand sf ad"
,
  value: "opt4"
  label: "Great!\ndfa gad df ad mand sf\nad mand sf ad small"
]

@radioOptionsIrritable = [
  value: "opt1"
  label: "Irritable\ndt1 whoaos dt1 whoaos dfa"
,
  value: "opt2"
  label: "Fairly Irratable"
,
  value: "opt3"
  label: "Wow Irrated\nand sf ad"
,
  value: "opt4"
  label: "Irritating!\ndfa gad df ad mand sf\nad mand sf ad small"
,
  value: "opt5"
  label: "Infuriating\ndfa gad df ad mand sf\nad mand sf ad small"
,
  value: "opt6"
  label: "Blown away\ndfa gad df ad mand sf\nad mand sf ad small"
]

Topics.attachSchema new SimpleSchema(
  name:
    type: String
    label: "Name"
  created:
    type: Date
    label: "Created At"
    autoValue: ->
      if @isInsert
        new Date
      else if @isUpsert
        $setOnInsert: new Date
      else
        @unset()
  updated:
    type: Date
    label: "Updated At"
    autoValue: ->
      new Date()
  authorId:
    type: String
    regEx: SimpleSchema.RegEx.Id
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

@Topics = new Mongo.Collection('topics')

@radioOptions = ["opt1", "opt2", "opt3"]

Topics.attachSchema new SimpleSchema(
  name:
    type: String
    label: "Name"
  importance:
    type: Number
    label: "Importance"
    autoform:
      type: "range"
      min: 0
      max: 100
  stars:
    type: String
    label: "Stars"
    autoform:
      type: "range"
      min: 0
      max: 1
  tags:
    type: [String]
    label: "Tags"
    autoform:
      type: "text"
  feelingGood:
    type: String
    label: "Good"
    allowedValues: radioOptions
    optional: true
    autoform:
      type: "select-uncheckable-radio"
      options: ->
        _.map radioOptions, (option) ->
          {
            label: option
            value: option
          }
  feelingAnxious:
    type: String
    label: "Anxious"
    allowedValues: radioOptions
    autoform:
      type: "select-radio"
      options: ->
        _.map radioOptions, (option) ->
          {
            label: option
            value: option
          }
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

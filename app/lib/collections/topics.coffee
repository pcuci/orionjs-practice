@Topics = new Mongo.Collection('topics')

@radioOptions = [
  value: "opt1"
  label: "opt1 whoaos\ndt1 whoaos dt1 whoaos dfa"
,
  value: "opt2"
  label: "opt2"
,
  value: "opt3"
  label: "opt3fgfdsgsonelogword\nand sf ad"
,
  value: "opt4"
  label: "opt4sad\ndfa gad df ad mand sf\nad mand sf ad small"
]

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
    allowedValues: _.pluck(radioOptions, 'value')
    optional: true
    autoform:
      type: "select-uncheckable-radio"
      options: ->
        _.map radioOptions, (option) ->
          {
            label: option.label
            value: option.value
          }
  feelingAnxious:
    type: String
    label: "Anxious"
    allowedValues: _.pluck(radioOptions, 'value')
    autoform:
      type: "select-radio"
      options: ->
        _.map radioOptions, (option) ->
          {
            label: option.value
            value: option.value
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

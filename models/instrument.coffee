mongo = require 'mongoose'
extend = require 'mongoose-schema-extend'
Schema = mongo.Schema

fields =
  description: String
  enabled: Boolean

InstrumentSchema = new Schema fields,
  collection: 'instruments'
  discriminatorKey: '_type'

newFields = (dbFields) -> (req) ->
  reduced =
    enabled: true
  for fieldName, fieldType of dbFields
    if req.body[fieldName] != undefined
      reduced[fieldName] = req.body[fieldName]
    else
      reduced[fieldName] = switch fieldType
        when Boolean then false
        when Number  then 0.0
        when String  then ''
  reduced

intersectFields = (dbFields) -> (req) ->
  reduced = {}
  for k of dbFields
    if req.body[k] != undefined
      reduced[k] = req.body[k]
  reduced

module.exports =
  schema: InstrumentSchema
  fields: fields
  newFields: newFields
  intersectFields: intersectFields
  findExcludes:
    __v: 0
    _id: 0
    _type: 0
    enabled: 0

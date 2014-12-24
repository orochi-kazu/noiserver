mongo = require 'mongoose'
extend = require 'mongoose-schema-extend'
Schema = mongo.Schema

module.exports = new Schema({
  description: String
  enabled: Boolean
}, {
  collection: 'instruments'
  discriminatorKey: '_type'
})

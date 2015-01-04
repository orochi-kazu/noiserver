mongo = require 'mongoose'
Instrument = require './instrument'

fields =
  axisAccelX: Number
  axisAccelY: Number
  axisAccelZ: Number

  buttonA: Boolean
  buttonB: Boolean
  buttonPlus: Boolean
  buttonMinus: Boolean

WiimoteSchema = Instrument.schema.extend fields

module.exports =
  model: mongo.model 'wiimote', WiimoteSchema
  fields: fields
  newFields: Instrument.newFields fields
  intersectFields: Instrument.intersectFields fields
  findExcludes: Instrument.findExcludes

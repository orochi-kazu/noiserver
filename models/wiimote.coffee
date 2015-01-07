mongo = require 'mongoose'
Instrument = require './instrument'

type = 'wiimote'
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
  type: type
  mongoModel: mongo.model type, WiimoteSchema
  fields: fields
  newFields: Instrument.newFields fields
  intersectFields: Instrument.intersectFields fields
  findExcludes: Instrument.findExcludes

mongo = require 'mongoose'
InstrumentSchema = require './instrument'

WiimoteSchema = InstrumentSchema.extend
  axisAccelX: Number
  buttonA: Boolean

module.exports = mongo.model 'wiimote', WiimoteSchema

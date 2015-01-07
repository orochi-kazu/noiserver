mongo = require 'mongoose'
Instrument = require './instrument'
Wiimote = require './wiimote'

type = 'wiiguitar'
fields =
  axisJoyX: Number
  axisJoyY: Number
  axisWhammy: Number

  buttonGreen: Boolean
  buttonRed: Boolean
  buttonYellow: Boolean
  buttonBlue: Boolean
  buttonOrange: Boolean

  buttonGuitarPlus: Boolean
  buttonGuitarMinus: Boolean

  buttonPaddleUp: Boolean
  buttonPaddleDown: Boolean

for fieldName, fieldType in Wiimote.fields
  fields[fieldName] = fieldType

WiiGuitarSchema = Instrument.schema.extend fields

module.exports =
  type: type
  mongoModel: mongo.model type, WiiGuitarSchema
  schema: WiiGuitarSchema
  newFields: Instrument.newFields fields
  intersectFields: Instrument.intersectFields fields
  findExcludes: Instrument.findExcludes

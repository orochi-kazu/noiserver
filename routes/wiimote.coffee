defaultRest = require './default'
Wiimote = require '../models/wiimote'

defaultRest.rest Wiimote

module.exports = defaultRest.router

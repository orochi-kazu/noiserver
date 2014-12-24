router = require('express').Router()
Wiimote = require '../models/wiimote'

router.get '/', (req, res) ->
  Wiimote.find
    _type: 'wiimote'
    enabled: true
  , (err, collection) ->
    res.json collection.map (it) -> it._id

router.post '/', (req, res) ->
  mote = new Wiimote
    enabled: true
    axisAccelX: 0.0
    buttonA: false

  mote.save (err) ->
    if err
      res.end 400
    else
      res.status(201).json mote._id

module.exports = router

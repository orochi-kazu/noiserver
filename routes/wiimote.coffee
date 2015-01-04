router = require('express').Router()
Wiimote = require '../models/wiimote'

router.get '/', (req, res) ->
  Wiimote.model.find
    _type: 'wiimote'
    enabled: true
  , (err, collection) ->
    res.json collection.map (it) -> it._id

router.post '/', (req, res) ->
  object = new Wiimote.model Wiimote.newFields req
  object.save (err) ->
    if err
      res.status(500).json err
    else
      res.status(201).json object._id

router.get '/:id', (req, res) ->
  Wiimote.model.findOne
    _type: 'wiimote'
    _id: req.params.id
  , Wiimote.findExcludes
  , (err, object) ->
    if err
      res.status(500).json err
    else if object
      res.json object
    else
      res.status(404).end()

dbUpdate = (req, res, set) ->
  query =
    _type: 'wiimote'
    _id: req.params.id
  update =
    $set: set
  options = {}

  Wiimote.model.update query, update, options, (err) ->
    if err
      res.status(500).json err
    else
      res.status(200).end()

router.put '/:id', (req, res) ->
  dbUpdate req, res,
    Wiimote.intersectFields req

router.delete '/:id', (req, res) ->
  dbUpdate req, res,
    enabled: false

module.exports = router

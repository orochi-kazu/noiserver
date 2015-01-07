errorOr = (err, res, noError) ->
  if err
    res.status(500).json err
  else
    noError()

dbUpdate = (model, req, res, set) ->
  query =
    _type: model.type
    _id: req.params.id
  update =
    $set: set
  options = {}

  model.mongoModel.update query, update, options, (err) ->
    errorOr err, res, ->
      res.status(200).end()

defaultGetAll = (model) -> (req, res) ->
  model.mongoModel.find
    _type: model.type
    enabled: true
  , (err, collection) ->
    errorOr err, res, ->
      res.json collection.map (it) -> it._id

defaultPost = (model) -> (req, res) ->
  object = new model.mongoModel model.newFields req
  object.save (err) ->
    errorOr err, res, ->
      res.status(201).json object._id

defaultGetOne = (model) -> (req, res) ->
  model.mongoModel.findOne
    _type: model.type
    _id: req.params.id
  , model.findExcludes
  , (err, object) ->
    errorOr err, res, ->
      if object
        res.json object
      else
        res.status(404).end()

defaultPut = (model) -> (req, res) ->
  dbUpdate model, req, res,
    model.intersectFields req

defaultDelete = (model) -> (req, res) ->
  dbUpdate model, req, res,
    enabled: false

defaultRestRouter = (model) ->
  router = require('express').Router()
  router.get '/', defaultGetAll model
  router.post '/', defaultPost model
  router.get '/:id', defaultGetOne model
  router.put '/:id', defaultPut model
  router.delete '/:id', defaultDelete model
  router

module.exports =
  router: defaultRestRouter

  getAll: defaultGetAll
  post: defaultPost
  getOne: defaultGetOne
  put: defaultPut
  delete: defaultDelete

  dbUpdate: dbUpdate
  errorOr: errorOr

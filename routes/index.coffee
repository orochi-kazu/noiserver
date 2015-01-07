router = require('express').Router()
pack = require '../package.json'

router.get '/', (req, res) ->
  res.json
    instrument: ['GET']
    info: ['GET']

router.get '/info', (req, res) ->
  res.json
    name: pack.name
    description: pack.description
    version: pack.version

module.exports = router

router = require('express').Router()

router.get '/', (req, res) ->
  res.json
    wii: ['GET']
    #ios: ['GET']

router.get '/wii', (req, res) ->
  verbs = ['GET', 'POST']
  res.json
    mote:   verbs
    guitar: verbs
    '{type}/{id}': ['GET', 'POST', 'PUT', 'DELETE']

module.exports = router
